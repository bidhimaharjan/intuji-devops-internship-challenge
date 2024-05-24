# Docker and Jenkins Setup

This repository contains scripts and configurations for setting up Docker, Jenkins, and deploying a PHP web application.


## What You Need

- A machine running Linux (Ubuntu)
- Docker installed (see steps below)
- Jenkins installed (see steps below)
- Git installed


## Step-by-Step Guide

### Step 1: Install Docker 

Run the following bash script to install Docker:

chmod +x install_docker.sh
./install_docker.sh


### Step 2: Clone the Application Repository 

git clone https://github.com/silarhi/php-hello-world.git
cd php-hello-world


### Step 3: Create and Build Docker Image

Create a Dockerfile in the root directory of the cloned repository:
# Use an official PHP image with Apache
FROM php:7.4-apache

# Copy the current directory contents into the container at /var/www/html/
COPY . /var/www/html/

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2-foreground"]


Build the Docker image:
docker build -t dockerhub_username/php-hello-world .


Push the Docker image to Docker Hub:
docker login
docker push dockerhub_username/php-hello-world


### Step 4: 
Create a docker-compose.yml file:

version: '3'
services:
  web:
    image: dockerhub_username/php-hello-world
    ports:
      - "8080:80"
      

### Step 5: Install Jenkins
Run the following script to install Jenkins:

chmod +x install_jenkins.sh
./install_jenkins.sh

Access Jenkins by navigating to http://server_ip:8080 and use the initial admin password to unlock Jenkins.


### Step 6: Install Jenkins Plugins
Install the necessary plugins in Jenkins:
Docker Pipeline
Git
GitHub


### Step 7: Set Up CI/CD Pipeline in Jenkins
Create a new Freestyle project in Jenkins. 
Configure the project to pull code from the GitHub repository.
Set up a build step to build the Docker image and deploy the container.



## Conclusion

This documentation provides a step-by-step guide to set up Docker, Jenkins, and a CI/CD pipeline for a PHP web application.

![Screenshot from 2024-05-23 14-29-53](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/3d0a156c-52ba-4778-86b3-ddef38942f3b)



