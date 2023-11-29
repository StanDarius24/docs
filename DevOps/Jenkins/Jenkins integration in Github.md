First of all we have to configure webhook, and for that we have 2 use cases.
- The build should trigger when somebody creates an pull request or somebody pushes something on a branch who is in an PR relation with main/master
- The build should trigger when somebody merge a branch with main/master.

Because Github doesnt offer filtering on events, we are going to use the following approach:
![[Screenshot 2023-09-18 at 11.54.00.png]]
having gdpr-service as an example:
Payload url for `pull_request` : https://tools.xentry.cloud.tbintra.net/jenkins/generic-webhook-trigger/invoke?token=order-gdpr-service-pr
Payload url `push` : https://tools.xentry.cloud.tbintra.net/jenkins/generic-webhook-trigger/invoke?token=order-gdpr-service-build
contentType: Json
We also need to connect the entries in Jenkins for the item that will build the PR `order-gdpr-service-pr` and for main branch `order-gdpr-service-build`
All the logic will be handled in jenkins script, we for that we are going to have one script for PR and another one for build both of them in 2 separate files.
![[Screenshot 2023-09-18 at 16.28.30.png]]

---

# Steps

1. Creating a GitHub app

2. Configuring the GitHub app

3. Install plugins on Jenkins.

4. Create new credentials on Jenkins.

5. Create a new pipeline on Jenkins.

6. Enable checks in GitHub

![[Screenshot 2023-09-18 at 16.14.07.png]]

# I. Creating a GitHub app

_We will use a GitHub app to manage the communication with Jenkins._

1. Open your “**profile settings**”.

2. Go to “**Developer Settings**”.
 ![[Screenshot 2023-09-18 at 16.15.27.png]]

3. Fill the following fields:

- Github **App name**, e.g.: My Jenkins App.
- Homepage URL, e.g. your profile.
- **Webhook** URL:

> i.e. https://{jenkins-host}/github-webhook/

_you can get_ `_<jenkins-host>_` _from the URL of your Jenkins instance._

4. Repository **permissions**:

_You need to set some permissions to enable the app to communicate with Jenkins and publish its status to GitHub._

- **Commit statuses**: “Read and Write”
- **Contents**: “Read-only”, you may need “Read & write” to update the repository such as tagging releases
- **Metadata**: “Read-only”
- **Pull requests**: “Read-only”

5. Subscribe to **events**:

- enable **all** events.

6. Click ‘**Create GitHub app**’

---

# II. Configure the GitHub app

1. We need to generate a private key authenticating to the GitHub app by clicking the ‘**generate a private key** option
![[Screenshot 2023-09-18 at 16.16.45.png]]

2. After a couple of seconds the key will be downloaded to your **downloads** folder.

3. Convert the key into a **different format** that Jenkins can use:

```bash
openssl pkcs8 -topk8 -inform PEM -outform PEM -in <the Key>.pem -out converted-github-app.pem -nocrypt
```

4. **Install** the GitHub app:

_Now, we need to install the app to our repository to be able to use it._
![[Screenshot 2023-09-18 at 16.18.10.png]]

# III. Install plugins on Jenkins

_We need to install the_ **_Github Checks Plugin_** _to be able to manage Github checks using Jenkins._

1. From the Dashboard go to “**Manage Jenkins**”.

2. Open “**Manage Plugins**”.

3. **Install** [Github Checks Plugin](https://plugins.jenkins.io/github-checks/).

# IV. Create new credentials on Jenkins

_As we do for any private repo/organization, we need to configure our credentials._

1. From the Dashboard go to “**Manage Jenkins**”.

2. Open “**Manage Credentials**”.

3. Pick your credential store e.g: “**global**”

4. Click “**Add credentials**”

5. Fill out the form:

- **Kind**: GitHub app
- **ID**: Its Name e.g.: my_app
- **App ID**: the GitHub app ID, it can be found in the ‘**About**’ section of your GitHub app in the **general tab**.
- **Key**: click add, paste the contents of the converted private key
- Click **OK**
# V. Jenkins Configuration
unfortunately in our organisation the plugin that we have its an old one that does not support to link the script from a different repo, so for that you need to place the jenkins script inside the project :(
![[Screenshot 2023-09-18 at 16.24.21.png]]

add a Branch Sources:
for example:
![[Screenshot 2023-09-18 at 16.25.59.png]]
set the path for the script
![[Screenshot 2023-09-18 at 16.26.23.png]]
Save and press on scan repository now
![[Screenshot 2023-09-18 at 16.27.03.png]]
# VI. Enable checks in GitHub

_The last step is to_ **_enable Github Check_** _in your repo:_

1. Open the repository settings.
2. Choose **Branches**.
3. Check “**Require status check to pass before merging**”.
![[Pasted image 20230918161855.png]]