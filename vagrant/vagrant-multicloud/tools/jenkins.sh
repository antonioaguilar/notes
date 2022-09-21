#!/bin/bash

# Install latest Jenkins

apt-get update

apt-get install -y ca-certificates wget curl nano openjdk-17-jre

java -version

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null;

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null;

apt-get update

apt-get install jenkins -y
