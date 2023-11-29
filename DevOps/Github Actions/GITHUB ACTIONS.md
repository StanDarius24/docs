


`GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline.`

---

Continuous integration (CI) is the process of automating and integrating code changes and updates from many team members during software development.

Continuous delivery (CD) is the ability to push new software into production multiple times per day, automating the delivery of applications to infrastructure environments.

![[Pasted image 20230319132055.png]]

### Github Actions Components

You can configure a GitHub Actions _workflow_ to be triggered when an _event_ occurs in your repository, such as a pull request being opened or an issue being created. Your workflow contains one or more _jobs_ which can run in sequential order or in parallel. Each job will run inside its own virtual machine _runner_, or inside a container, and has one or more _steps_ that either run a script that you define or run an _action_, which is a reusable extension that can simplify your workflow.

### Workflows

A workflow is a configurable automated process that will run one or more jobs. Workflows are defined by a YAML file checked in to your repository and will run when triggered by an event in your repository, or they can be triggered manually, or at a defined schedule.

 - YAML FILES
	
	![[Pasted image 20230319235631.png]]
	
	How to write yaml files:
	![[Pasted image 20230319235556.png]]

Path: `.github/workflows`

You can have multiple workflows, one for building and testing your pull requests, another one to deploy your app.

### Jobs

A job is a set of _steps_ in a workflow that is executed on the same runner. Each step is either a shell script that will be executed, or an _action_ that will be run. Steps are executed in order and are dependent on each other. Since each step is executed on the same runner, you can share data from one step to another. For example, you can have a step that builds your application followed by a step that tests the application that was built.

### Actions

An _action_ is a custom application for the GitHub Actions platform that performs a complex but frequently repeated task. Use an action to help reduce the amount of repetitive code that you write in your workflow files. An action can pull your git repository from GitHub, set up the correct toolchain for your build environment, or set up the authentication to your cloud provider.

### Runners

A runner is a server that runs your workflows when they're triggered. Each runner can run a single job at a time. GitHub provides Ubuntu Linux, Microsoft Windows, and macOS runners to run your workflows; each workflow run executes in a fresh, newly-provisioned virtual machine.

---

### What we can do?

- [ ]  Automating builds and tests; 
- [ ]  Publishing packages;
- [ ]  Deployment;
- [ ]  Managing issues and pull requests;

---

### Create an example workflow

https://github.com/HibyteIntelli/angular-todo

branch master

```yaml
name: Angular CI  
  
run-name: ${{ github.actor }} is learning GitHub Actions  
  
on:  
  push:  
    branches: [ master ]  
  
jobs:  
  install-and-build:  
    runs-on: ubuntu-latest  
    steps:  
      - uses: actions/checkout@v1
      - name: npm install and npm run CI commands  
        run: |  
          npm i  
          npm run build
```

| Action                                                      | Description                                                                                                                                                                                                                                                                                                                                                            |     
| -------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name: Angular CI                                         | _Optional_ - The name of the workflow as it will appear in the "Actions" tab of the GitHub repository.                                                                                                                                                                                                                                                          |     |
| run-name: ${{ github.actor }} is learning GitHub Actions | _Optional_ - The name for workflow runs generated from the workflow, which will appear in the list of workflow runs on your repository's "Actions" tab.                                                                                                                                                                                                         |     |
| on: [push]                                               | Specifies the trigger for this workflow. This example uses the `push` event, we can also specify the branch                                                                                                                                                                                                                                                     |     |
| jobs:                                                    | Groups together all the jobs that run in the `workflow1` workflow.                                                                                                                                                                                                                                                                                              |     |
| install-and-build:                                       | Defines a job named `install-and-build`. The child keys will define properties of the job.                                                                                                                                                                                                                                                                      |     |
| runs-on: ubuntu-latest                                   | Configures the job to run on the latest version of an Ubuntu Linux runner. This means that the job will execute on a fresh virtual machine hosted by GitHub.                                                                                                                                                                                                    |     |
| steps:                                                   | Groups together all the steps that run in the `install-and-build` job. Each item nested under this section is a separate action or shell script.                                                                                                                                                                                                                |     |
| - uses: actions/checkout@v3                              | The `uses` keyword specifies that this step will run `v3` of the `actions/checkout` action. This is an action that checks out your repository onto the runner, allowing you to run scripts or other actions against your code (such as build and test tools). You should use the checkout action any time your workflow will run against the repository's code. |     |
| - run: npm i; npm run build                              | The `run` keyword tells the job to execute a command on the runner. `pipe` the node will execute sequentially.                                                                                                                                                                                                                                                  |     |

---

https://github.com/HibyteIntelli/spring-todo.git

```yaml
name: Build Branch  
  
on:  
  push:  
    branches:  
      - "**"  
  
jobs:  
  build:  
    runs-on: ubuntu-latest  
    steps:  
      - uses: actions/checkout@v3  
  
      - name: Set up Java  
        uses: actions/setup-java@v2  
        with:  
          distribution: 'adopt'  
          java-version: '19'  
  
      - name: Set up Maven  
        uses: stCarolas/setup-maven@v4  
        with:  
          maven-version: 3.6.2  
  
      - name: Check Maven Version  
        run: mvn --version  
  
 #     - name: Run Super-Linter  
 #       uses: github/super-linter@v3.17.0 
 #       with: 
 #         path: /src 
 #       env: 
 #         DEFAULT_BRANCH: master 
 #         GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}  
      - name: Cache local Maven repository  
        uses: actions/cache@v2  
        with:  
          path: ~/.m2/repository  
          key: ${{ runner.os }}-maven-${{ hashFiles('**/pom.xml') }}  
          restore-keys: |  
            ${{ runner.os }}-maven-  
  
      - name: Test and build  
        run: mvn clean install
```


```
|-- hello-world (repository)
|   |__ .github
|       └── workflows
|           └── my-first-workflow.yml
|       └── actions
|           |__ hello-world-action
|               └── action.yml
```

JAR FILES ARE NOT ENOUGH

```yaml
steps:
  - uses: actions/checkout@v3
    name: Check out code

  - uses: mr-smithers-excellent/docker-build-push@v6
    name: Build & push Docker image
    with:
      image: repo/image
      tags: v1, latest
      registry: registry-url.io
      dockerfile: Dockerfile.ci
      username: ${{ secrets.DOCKER_USERNAME }}
      password: ${{ secrets.DOCKER_PASSWORD }}
```



# DEPENDABOT & BRANCHES
