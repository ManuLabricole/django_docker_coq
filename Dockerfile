# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
ARG REQUIREMENTS_FILE=requirements.txt
COPY ${REQUIREMENTS_FILE} /usr/src/app/
RUN pip install --no-cache-dir -r ${REQUIREMENTS_FILE}

# Copy the entire project
COPY . /usr/src/app/

# Ensure scripts are executable
RUN chmod +x /usr/src/app/scripts/*.sh

# Expose the port the app runs on
EXPOSE 8000

# Set environment variables for Django
ENV DJANGO_SETTINGS_MODULE=core.settings

# Run the Django development server
CMD ["./scripts/wait-for-it.sh", "db:5432", "--", "sh", "-c", "python investment_manager/manage.py runserver 0.0.0.0:8000"]
