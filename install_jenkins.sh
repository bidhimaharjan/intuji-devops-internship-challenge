#!/bin/bash

# Update the package database
sudo apt-get update

# Install Java (Jenkins requirement)
sudo apt-get install openjdk-11-jre -y

# Add the Jenkins Debian repository
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package database again
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y

# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins to start at boot
sudo systemctl enable jenkins

# Output the initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

