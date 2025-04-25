#!/bin/bash

# Step 1: Add Jenkins GPG key
echo "Adding Jenkins GPG key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Step 2: Add Jenkins repository to sources list
echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 3: Update package lists
echo "Updating package list..."
sudo apt-get update

# Step 4: Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install -y jenkins

# Step 5: Install OpenJDK (if not already installed)
echo "Installing OpenJDK 21..."
sudo apt-get install -y fontconfig openjdk-21-jre

# Step 6: Check Java version
echo "Checking Java version..."
java -version

# Step 7: Enable Jenkins to start on boot
echo "Enabling Jenkins service..."
sudo systemctl enable jenkins

# Step 8: Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Step 9: Check Jenkins service status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins.service

# Step 10: Reload systemd daemon (if needed)
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Step 11: Display initial Jenkins admin password
echo "Fetching initial Jenkins admin password..."
cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins installation and setup complete!"

