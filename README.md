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


## Screenshots

![Screenshot from 2024-05-23 14-29-53](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/3d0a156c-52ba-4778-86b3-ddef38942f3b)
![Screenshot from 2024-05-23 14-38-27](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/80e5c9bb-d6ba-4c9c-af46-0b631e0cce3f)
![Screenshot from 2024-05-23 14-43-26](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/4c9dc625-afbb-478a-b5fa-0c54c158fd76)
![Screenshot from 2024-05-23 18-12-10](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/00877328-b4cd-419c-8bb6-1d243dcb7fbb)
![Screenshot from 2024-05-23 18-12-33](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/f7390023-a48e-46a5-b2ac-15b28fecc7c8)
![Screenshot from 2024-05-23 18-15-06](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/f0f3cc09-09ac-410a-a1a9-7f895207e142)
![Screenshot from 2024-05-24 05-03-04](https://github.com/bidhimaharjan/intuji-devops-internship-challenge/assets/119237685/5161df4d-5efa-4ead-9cfd-70309df4c5b7)




## Conclusion

This documentation provides a step-by-step guide to set up Docker, Jenkins, and a CI/CD pipeline for a PHP web application.



