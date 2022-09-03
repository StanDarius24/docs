-   Build and run an image as a container
-   Share images using Docker Hub
-   Deploy Docker applications using multiple containers with a database
-   Run applications using Docker Compose

## Start the tutorial

If you’ve already run the command to get started with the tutorial, congratulations! If not, open a command prompt or bash window, and run the command:


```bash
$ docker run -d -p 80:80 docker/getting-started
```

You’ll notice a few flags being used. Here’s some more info on them:

-   `-d` - Run the container in detached mode (in the background).
-   `-p 80:80` - Map port 80 of the host to port 80 in the container. To access the tutorial, open a web browser and navigate to `http://localhost:80`. If you already have a service listening on port 80 on your host machine, you can specify another port. For example, specify `-p 3000:80` and then access the tutorial via a web browser at `http://localhost:3000`.
-   `docker/getting-started` - Specify the image to use.

! **Tip**

You can combine single character flags to shorten the full command. As an example, the command above could be written as:

``` shell
$ docker run -dp 80:80 docker/getting-started
```

## What is a container?

Now that you’ve run a container, what _is_ a container? Simply put, a container is a sandboxed process on your machine that is isolated from all other processes on the host machine. That isolation leverages [kernel namespaces and cgroups](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504), features that have been in Linux for a long time. Docker has worked to make these capabilities approachable and easy to use. To summarize, a container:

-   is a runnable instance of an image. You can create, start, stop, move, or delete a container using the DockerAPI or CLI.
-   can be run on local machines, virtual machines or deployed to the cloud.
-   is portable (can be run on any OS).
-   is isolated from other containers and runs its own software, binaries, and configurations.

## What is a container image?

When running a container, it uses an isolated filesystem. This custom filesystem is provided by a **container image**. Since the image contains the container’s filesystem, it must contain everything needed to run an application - all dependencies, configurations, scripts, binaries, etc. The image also contains other configuration for the container, such as environment variables, a default command to run, and other metadata.

