#jenkins

#### In this tutorial I will present the way we can add a new node to jenkins that will deal only with certain mobile projects (fastlane).

Lets consider the following scenario. We want an architecture but ci/cd for ios applications.For this type of applications we need the build to be made by a device from this ecosystem.So we cant create an ios application on a server running linux.

---

Here comes a flexible way in which jenkins manages this issues.

There are a few things needed for this:
1. we need a server to run the jenkins. (the server where the jenkins run is called master it may deal with certain actions, but is not recommended).
2. we need an apple device for ios applications. Also on this device i will build the android applications, the steps are valid for android even if we have a device that runs linux.
3. the projects are perfectly functional and manage to be deployed through fastlane

---

First of all we need to add the new node in our architecture.
For this we must to be able to connect via ssh from the master (where jenkins runs) to the slave (apple device).

```bash
sudo systemsetup -setremotelogin on
sudo systemsetup -getremotelogin <- you can check
reboot
```
We probably need privileges for the disk, in settings -> security.

As soon as we can connect to the apple device we can start the configurations for the jenkins.

Dashboard -> Manage Jenkins -> plugins 
	and install multibranch pipeline.

Dashboard -> Nodes -> New Node:
	Permanent Agent
		Remote root directory -> add the path for where the project is saved in your apple device
		Usage -> only build jobs with label expressions matching this node
	Launch method select SSH
		Host -> ip addr
		Credentials root:pass

And save

![[Screenshot 2022-11-22 at 15.50.21.png]]

should look like this after fetching informations.

we can define multiple nodes that targets the same device but have different paths (android/ios) in my case.

In our project we need a Jenkinsfile: 

```groovy
#!groovy
@Library('werft-commons-jenkins-pipeline')

pipeline {
	agent {
		label 'ios-build' //here we cand define the node that will build the project
	}
	stages {
		stage('Test') {
			steps {
				echo 'hello!'
			}		
		}
	}
}
```

Then in jenkins -> Dashboard -> New Item,
we select multibranch pipeline you may need a few more plug-ins, git / pocket dock etc.

In branch sources we add the project url with credentials. 
	then we have to specify the bitbucket team. If the bitbucket team is correct you can select from the repository name list, your project.
	we add in behaviours, discover branches and we select all branches.
	then in Build configuration we select by jenkinsfile and jenkinsfile in script path


