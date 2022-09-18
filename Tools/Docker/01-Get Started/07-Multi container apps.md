Up to this point, we have been working with single container apps. But, we now want to add MySQL to the application stack. The following question often arises - “Where will MySQL run? Install it in the same container or run it separately?” In general, **each container should do one thing and do it well.** A few reasons:
-   There’s a good chance you’d have to scale APIs and front-ends differently than databases
-   Separate containers let you version and update versions in isolation
-   While you may use a container for the database locally, you may want to use a managed service for the database in production. You don’t want to ship your database engine with your app then.
-   Running multiple processes will require a process manager (the container only starts one process), which adds complexity to container startup/shutdown
And there are more reasons. So, we will update our application to work like this:

| ---       | --- |
| -------- | --- |
| Todo App | MySql    |

## Container networking
Remember that containers, by default, run in isolation and don’t know anything about other processes or containers on the same machine. So, how do we allow one container to talk to another? The answer is **networking**. Now, you don’t have to be a network engineer (hooray!). Simply remember this rule...

**!Note : If two containers are on the same network, they can talk to each other. If they aren’t, they can’t.*

## Start MySQL
There are two ways to put a container on a network: 1) Assign it at start or 2) connect an existing container. For now, we will create the network first and attach the MySQL container at startup.

1. Create the network.
```shell
$ docker network create todo-app
```
2. Start a MySQL container and attach it to the network. We’re also going to define a few environment variables that the database will use to initialize the database (see the “Environment Variables” section in the [MySQL Docker Hub listing].
```shell
$ docker run -d \
     --network todo-app --network-alias mysql \
     -v todo-mysql-data:/var/lib/mysql \
     -e MYSQL_ROOT_PASSWORD=secret \
     -e MYSQL_DATABASE=todos \
     mysql:5.7
```

You’ll also see we specified the `--network-alias` flag. We’ll come back to that in just a moment.

**!TIP: You’ll notice we’re using a volume named `todo-mysql-data` here and mounting it at `/var/lib/mysql`, which is where MySQL stores its data. However, we never ran a `docker volume create` command. Docker recognizes we want to use a named volume and creates one automatically for us.
3. To confirm we have the database up and running, connect to the database and verify it connects.
```bash
$ docker exec -it <mysql-container-id> mysql -u root -p
```
When the password prompt comes up, type in **secret**. In the MySQL shell, list the databases and verify you see the `todos` database.
```mysql
mysql> SHOW DATABASES;
```
You should see output that looks like this: