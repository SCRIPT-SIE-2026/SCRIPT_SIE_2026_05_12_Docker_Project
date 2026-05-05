# -----------------------------------------------------------------------------------------------
# Lets Complete this file

# Some of the most common instructions:
# FROM <image> - this specifies the base image that the build will extend.
# WORKDIR <path> - this instruction specifies the "working directory" or the path in the image where files will be copied and commands will be executed.
# COPY <host-path> <image-path> - this instruction tells the builder to copy files from the host and put them into the container image.
# RUN <command> - this instruction tells the builder to run the specified command.
# CMD ["<command>", "<arg1>"] - this instruction sets the default command a container using this image will run.

# Source: https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/
# -----------------------------------------------------------------------------------------------
# Step 1: Choose a pertient image base 
# Base image
FROM python:3.11    

## Step 2: Install necessary packages
# Add needed python modules
RUN ...

## Step 3: Setup a working directory at /app
WORKDIR ...

## Step 4: Copy the content of the current directory to /app directory of the container
COPY ...

## Step 5: Make the need changes to execute compute.py when the container is launch
CMD ["bash"]