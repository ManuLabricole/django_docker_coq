# Use the official Python image from the Docker Hub
FROM python:3.11-slim-bullseye

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file into the container
COPY ./requirements.txt /code/requirements.txt

# Install any needed packages specified in requirements.txt
# Install dependencies
RUN set -xe \
    && apt-get update \
    && apt-get install -y --no-install-recommends build-essential libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /code

# Make the entrypoint script executable
RUN chmod +x entrypoint.sh

# Specify the command to run on container start
ENTRYPOINT ["code/entrypoint.sh"]