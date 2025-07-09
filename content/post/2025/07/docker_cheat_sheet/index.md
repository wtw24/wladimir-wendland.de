+++
title = "Docker Cheat Sheet"
date = 2025-07-09
tags = [
  "docker",
  "cheatsheet",
  "DevOps",
]
categories = [
  "DevOps",
]
+++

I'm sure you've heard the famous developer phrase, "But it works on my machine!" It became a meme for a reason. Differences in environments, library versions, and system configurations often lead to chaos. Docker solves this problem by packaging an application and all its dependencies into isolated units called containers.

This article is your all-in-one Docker cheat sheet. I've gathered everything I find essential, from running your first container to advanced cleanup techniques and Dockerfile best practices.
<!--more-->

## Cheatsheet for Docker CLI

### Running a New Container
~~~shell
# Run a new container from an image
docker run IMAGE
docker run nginx

# ... and assign it a name
docker run --name CONTAINER_NAME IMAGE
docker run --name web nginx

# ... and map a port
docker run -p HOST_PORT:CONTAINER_PORT IMAGE
docker run -p 8080:80 nginx

# ... and publish all exposed ports
docker run -P IMAGE
docker run -P nginx

# ... and run the container in the background (detached mode)
docker run -d IMAGE
docker run -d nginx

# ... and automatically remove the container when it stops
docker run --rm IMAGE
docker run --rm -it ubuntu bash

# ... and assign a hostname inside the container
docker run --hostname HOSTNAME IMAGE
docker run --hostname srv nginx

# ... and add a host entry to the container's /etc/hosts
docker run --add-host HOSTNAME:IP IMAGE

# ... and mount a local directory (bind mount)
docker run -v HOST_DIR:TARGET_DIR IMAGE
docker run -v ${PWD}:/usr/share/nginx/html nginx

# ... or use a named volume (recommended for data)
docker run -v volume-name:/var/lib/mysql mysql

# ... but change the default command (entrypoint)
docker run -it --entrypoint EXECUTABLE IMAGE
docker run -it --entrypoint bash nginx
~~~

### Managing Containers
~~~shell
# Show a list of running containers
docker ps

# Show a list of all containers (including stopped ones)
docker ps -a

# Remove a container
docker rm CONTAINER
docker rm web

# Forcefully remove a running container
docker rm -f CONTAINER
docker rm -f web

# Remove all stopped containers
docker container prune

# Stop a running container
docker stop CONTAINER
docker stop web

# Copy a file from the container to the host
docker cp CONTAINER:SOURCE_PATH TARGET_PATH
docker cp web:/etc/nginx/nginx.conf .

# Run a command inside a running container (e.g., a shell)
docker exec -it CONTAINER EXECUTABLE
docker exec -it web bash

# Rename a container
docker rename OLD_NAME NEW_NAME
docker rename 096 web

# Create an image from a container's current state
# (Note: This is considered bad practice. Use a Dockerfile for reproducibility instead)
docker commit CONTAINER NEW_IMAGE_NAME
docker commit web my-custom-nginx
~~~

### Managing Images
~~~shell
# Pull an image from a repository
docker pull IMAGE[:TAG]
docker pull nginx:latest

# Push an image to a repository
docker push USERNAME/IMAGE_NAME:TAG
docker push myuser/myimage:1.0

# Remove an image
docker rmi IMAGE

# Show a list of all images
docker images

# Remove dangling images (those without tags)
docker image prune

# Remove all unused images
docker image prune -a

# Build an image from a Dockerfile in the current directory
docker build .

# Build an image and assign it a tag
docker build -t IMAGE_NAME:TAG DIRECTORY
docker build -t myapp:1.0 .

# Tag an existing image
docker tag SOURCE_IMAGE TARGET_IMAGE
docker tag ubuntu ubuntu:20.04

# Save an image to a .tar archive
docker save IMAGE > FILE.tar
docker save nginx > nginx.tar

# Load an image from a .tar archive
docker load -i FILE.tar
docker load -i nginx.tar
~~~

### Information & Stats
~~~shell
# Show container logs
docker logs CONTAINER
docker logs web

# Follow container logs in real-time
docker logs -f CONTAINER
docker logs -f web

# Show resource usage statistics for running containers
docker stats

# Show processes running in a container
docker top CONTAINER
docker top web

# Show detailed information about a Docker object (container, image, etc.)
docker inspect OBJECT_NAME
docker inspect web

# Show changed files in the container's filesystem
docker diff CONTAINER
docker diff web

# Show a container's mapped ports
docker port CONTAINER
docker port web
~~~

## Useful Tips

### Global Cleanup (Prune)

*   `docker system prune` - Remove all stopped containers, unused networks, dangling images, and build cache.
*   `docker volume prune` - Remove all unused volumes.
*   `docker network prune` - Remove all unused networks.
*   `docker container prune` - Remove all stopped containers.
*   `docker image prune` - Remove dangling images.
*   `docker system prune -a --volumes` - **(WARNING: Removes ALL unused items, including images without containers and volumes. Use with caution!)**

### Quickly Remove All Containers
```sh
# Forcefully stops and removes all containers (running and stopped)
docker rm -f $(docker ps -aq)
```

---

## Dockerfile: Key Instructions

*   `FROM` - Sets the base image.
*   `LABEL` - Adds metadata to the image (e.g., `LABEL maintainer="user@example.com"`). Replaces the deprecated `MAINTAINER`.
*   `RUN` - Executes a command in a new layer and commits the result. Used for installing packages, compiling, etc.
*   `COPY` - Copies files and folders from the host to the image. Preferred over `ADD`.
*   `ADD` - Similar to `COPY`, but with extra features (can unpack archives and download from URLs). Use `COPY` unless you need these features.
*   `ENV` - Sets an environment variable. It's available during the build and in the running container.
*   `ARG` - Defines a variable available **only during the build** (`docker build --build-arg VAR=value`).
*   `WORKDIR` - Sets the working directory for subsequent commands (`RUN`, `CMD`, `ENTRYPOINT`, `COPY`, `ADD`).
*   `EXPOSE` - Informs Docker that the container listens on the specified port. **Does not actually publish the port**; the `-p` flag in `docker run` does that.
*   `VOLUME` - Creates a mount point for persistent data.
*   `USER` - Sets the user for subsequent commands.
*   `CMD` - Sets the default command and/or arguments for a container. Can be overridden at runtime (`docker run image new-command`).
*   `ENTRYPOINT` - Configures the container to run as an executable. The `ENTRYPOINT` command is **not easily overridden** like `CMD`.
*   `HEALTHCHECK` - Defines a command to check the container's health.
*   `SHELL` - Allows overriding the default shell used for running commands.

### Explanation: CMD vs ENTRYPOINT

This is a key distinction that is important to understand.

*   **`ENTRYPOINT`**: The main command that always executes.
*   **`CMD`**: Default arguments for the `ENTRYPOINT`.

**Example:**
```dockerfile
ENTRYPOINT ["/bin/ping", "-c", "3"]
CMD ["google.com"]
```
*   `docker run my-ping-image` -> will execute `/bin/ping -c 3 google.com`
*   `docker run my-ping-image habr.com` -> will execute `/bin/ping -c 3 habr.com` (only the `CMD` was overridden).

Docker is a powerful tool that has truly changed how I approach software development and operations. It might seem complex at first, but once you master these basic commands, you'll quickly appreciate its benefits: speed, portability, and reproducibility.

I hope this cheat sheet becomes your trusted companion in the world of containerization.

Happy coding
