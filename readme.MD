# Docker Commands and Explanations

## Build Docker Image

To build the Docker image, use the following command:

```sh
docker build -t my-python-app .
```

### Explanation

- docker build: Command used to build an image from a Dockerfile.
- -t my-python-app: The -t flag tags the image with the name my-python-app for easy reference.
- .: The . specifies the build context, which is the current directory containing the Dockerfile and any other necessary files.

## Run Docker Container

To run the Docker container, use the following command:
    
```sh
docker run -it --name my-python-container my-python-app /bin/bash
```
### Explanation

- docker run: Command used to create and start a new container from a specified image.
- -it: Combined flags for interactive terminal:
- --->  -i (interactive): Keeps the STDIN open, even if not attached. Useful for interactive processes.
- ---> -t (tty): Allocates a pseudo-TTY. Provides a terminal interface, making it possible to interact with the container as if you were working in a terminal session.
- --name my-python-container: The --name flag assigns a name to the container, my-python-container. Naming containers helps with managing and referencing them later.
- my-python-app: The name of the Docker image to run, which we built and tagged as my-python-app.
- /bin/bash: Specifies the command to run inside the container. Here, /bin/bash starts a Bash shell inside the container, allowing you to interact with it using the Bash shell.

### What Happens When You Run This Command

- Creates a New Container: Docker creates a new container based on the my-python-app image.
- Allocates a TTY and Keeps STDIN Open: The -it flags ensure a terminal interface is provided, allowing interaction with the container.
- Names the Container: The container is named my-python-container for easy reference.
- Runs the Bash Shell: Inside the container, the /bin/bash command is executed, starting a Bash shell.
- Interactive Session: You are given an interactive session inside the container, allowing you to explore the filesystem, run commands, and interact with the container as if it were a separate Linux system.
