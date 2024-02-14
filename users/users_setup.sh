#!/bin/bash

# Create users
useradd -m alice
useradd -m bob
useradd -m eve

# Set passwords for users
echo "alice:password1" | chpasswd
echo "bob:password2" | chpasswd
echo "eve:password3" | chpasswd

# Install sudo and give users sudo privileges
apt-get install -y sudo
echo "alice ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "bob ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "eve ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

