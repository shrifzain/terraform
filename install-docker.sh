#!/bin/bash
# Update package list
sudo apt update -y

# Install required packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Update package list again to include Docker's repository
sudo apt update -y

# Install Docker
sudo apt install -y docker-ce

# Check Docker status (optional step for debugging purposes)
sudo systemctl status docker

# Add the current user to the Docker group to avoid needing sudo for Docker commands
sudo usermod -aG docker ${USER}

# Optional: You can switch to the root user (this isn't usually needed for scripts)
sudo su
