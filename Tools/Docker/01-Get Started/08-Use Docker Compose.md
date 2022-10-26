# Use Docker Compose

[Docker Compose](https://docs.docker.com/compose/) is a tool that was developed to help define and share multi-container applications. With Compose, we can create a YAML file to define the services and with a single command, can spin everything up or tear it all down.

The _big_ advantage of using Compose is you can define your application stack in a file, keep it at the root of your project repo (it’s now version controlled), and easily enable someone else to contribute to your project. Someone would only need to clone your repo and start the compose app. In fact, you might see quite a few projects on GitHub/GitLab doing exactly this now.

```bash
$ docker-compose version
```

## Create the Compose file
1.  At the root of the app project, create a file named `docker-compose.yml`.
2. In the compose file, we’ll start off by defining the schema version. In most cases, it’s best to use the latest supported version. You can look at the [Compose file reference](https://docs.docker.com/compose/compose-file/) for the current schema versions and the compatibility matrix.
```bash
 version: "3.7"
```
3. Next, we’ll define the list of services (or containers) we want to run as part of our application.
```bash
 version: "3.7"
 services:
```
And now, we’ll start migrating a service at a time into the compose file.

## Define the app service
To remember, this was the command we were using to define our app container.
```bash
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```

1. First, let’s define the service entry and the image for the container. We can pick any name for the service. The name will automatically become a network alias, which will be useful when defining our MySQL service.
```bash
 version: "3.7"

 services:
   app:
     image: node:12-alpine
```
2. Typically, you will see the `command` close to the `image` definition, although there is no requirement on ordering. So, let’s go ahead and move that into our file.

```bash
 version: "3.7"

 services:
   app:
     image: node:12-alpine
     command: sh -c "yarn install && yarn run dev"
```
3. Let’s migrate the `-p 3000:3000` part of the command by defining the `ports` for the service. We will use the [short syntax](https://docs.docker.com/compose/compose-file/compose-file-v3/#short-syntax-1) here, but there is also a more verbose [long syntax](https://docs.docker.com/compose/compose-file/compose-file-v3/#long-syntax-1) available as well.
```bash
 version: "3.7"

 services:
   app:
     image: node:12-alpine
     command: sh -c "yarn install && yarn run dev"
     ports:
       - 3000:3000
```
4. Next, we’ll migrate both the working directory (`-w /app`) and the volume mapping (`-v "$(pwd):/app"`) by using the `working_dir` and `volumes` definitions. Volumes also has a [short](https://docs.docker.com/compose/compose-file/compose-file-v3/#short-syntax-3) and [long](https://docs.docker.com/compose/compose-file/compose-file-v3/#long-syntax-3) syntax.
One advantage of Docker Compose volume definitions is we can use relative paths from the current directory.
```bash
 version: "3.7"

 services:
   app:
     image: node:12-alpine
     command: sh -c "yarn install && yarn run dev"
     ports:
       - 3000:3000
     working_dir: /app
     volumes:
       - ./:/app
```
5. Finally, we need to migrate the environment variable definitions using the `environment` key.
```bash
 version: "3.7"

 services:
   app:
     image: node:12-alpine
     command: sh -c "yarn install && yarn run dev"
     ports:
       - 3000:3000
     working_dir: /app
     volumes:
       - ./:/app
     environment:
       MYSQL_HOST: mysql
       MYSQL_USER: root
       MYSQL_PASSWORD: secret
       MYSQL_DB: todos
```

### Define the MySQL service
Now, it’s time to define the MySQL service. The command that we used for that container was the following:
```bash
docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7
```
If you are using PowerShell then use this command:
```bash
PS> docker run -d `
  --network todo-app --network-alias mysql `
  -v todo-mysql-data:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=secret `
  -e MYSQL_DATABASE=todos `
  mysql:5.7
```
1. We will first define the new service and name it `mysql` so it automatically gets the network alias. We’ll go ahead and specify the image to use as well.

#devops #docker 