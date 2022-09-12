## Update the source code

1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.

```html
 -                <p className="text-center">No items yet! Add one above!</p>
 +                <p className="text-center">You have no todo items yet! Add one above!</p>
```

2. Let’s build our updated version of the image, using the same command we used before.

```bash
$ docker build -t getting-started .
```

3. Let’s start a new container using the updated code.

```bash
$ docker run -dp 3000:3000 getting-started
```

**Uh oh!** You probably saw an error like this (the IDs will be different):

```shell
docker: Error response from daemon: driver failed programming external connectivity on endpoint ...
```

So, what happened? We aren’t able to start the new container because our old container is still running. It is because the container is using the host’s port 3000 and only one process on the machine (containers included) can listen to a specific port. To fix this, we need to remove the old container.

## Replace the old container
To remove a container, it first needs to be stopped. Once it has stopped, it can be removed. We have two ways that we can remove the old container. Feel free to choose the path that you’re most comfortable with.

### Remove a container using the CLI
1. Get the ID of the container by using the `docker ps` command.
```shell
$ docker ps
```
2. Use the `docker stop` command to stop the container.
```bash
 # Swap out <the-container-id> with the ID from docker ps
 $ docker stop <the-container-id>
```
3. Once the container has stopped, you can remove it by using the `docker rm` command.
```shell
$ docker rm <the-container-id>
```

**!NOTE : You can stop and remove a container in a single command by adding the “force” flag to the `docker rm` command. For example: `docker rm -f <the-container-id>`

### Start the updated app container
1. Now, start your updated app.
```shell
$ docker run -dp 3000:3000 getting-started
```
2. 1.  Refresh your browser and you should see your updated help text!


#docker 