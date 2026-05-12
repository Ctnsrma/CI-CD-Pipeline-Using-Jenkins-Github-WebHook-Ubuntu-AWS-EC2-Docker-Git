#!/bin/bash

exec > /var/log/user-data.log 2>&1
set -eux

export DEBIAN_FRONTEND=noninteractive

# =================================================
# UPDATE SYSTEM
# =================================================

apt update -y
apt upgrade -y

# =================================================
# BASIC PACKAGES
# =================================================

apt install -y \
    curl \
    wget \
    unzip \
    git \
    gnupg2 \
    ca-certificates \
    fontconfig \
    openjdk-17-jre

# =================================================
# INSTALL DOCKER
# =================================================

apt install -y docker.io

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

chmod 666 /var/run/docker.sock

# =================================================
# INSTALL NODEJS
# =================================================

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

apt install -y nodejs

npm install -g @nestjs/cli

# =================================================
# DONE
# =================================================

echo "===== BASIC SETUP COMPLETE ====="

# finally
# finally done