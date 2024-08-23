 #!/bin/bash

# Exit on error
set -e

# Function to print messages
print_message() {
    echo "-----------------------------------"
    echo "$1"
    echo "-----------------------------------"
}

# Update the package index
print_message "Updating package index"
sudo apt-get update

# Install prerequisites
print_message "Installing prerequisites"
sudo apt-get install -y wget unzip

# Download Terraform
print_message "Downloading Terraform"
TERRAFORM_VERSION="1.6.0"  # <<<<<<<<<<<<<<<<<<<<<<<<<<<0Replace with the desired version>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.#
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip the Terraform binary
print_message "Unzipping Terraform"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move the binary to /usr/local/bin
print_message "Installing Terraform"
sudo mv terraform /usr/local/bin/

# Clean up
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify Terraform installation
print_message "Verifying Terraform installation"
terraform version

print_message "Terraform installation completed successfully!"
