#!/bin/bash


#STEP 1: UPDATING UBUNTU MACHINE
sudo apt update

 echo " #########UBUNTU UPDATED########"


#STEP 2: Installation steps for AMAZON CLI
 sudo  apt install zip -y
 curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
 unzip awscliv2.zip
 sudo ./aws/install

 echo "########## AMAZON CLI INSTALLED SUCESSFULLY #########"

  aws --version

#STEP 3: SECURITY CREDIENTIALS FOR AWS
 aws configure


#STEP 4: INSTALLING KUBECTL ON UBUNTU

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
 echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
 sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
 chmod +x kubectl
 mkdir -p ~/.local/bin
 mv ./kubectl ~/.local/bin/kubectl

#STEP 5: CHECKING THE VERSION OF KUBECTL


 kubectl version --client


#STEP 6: INSTALLING eksctl ON UBUNTU

# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin

#STEP 7: KUBENETS CLUSTER CREATION COMPLETED
echo " ######cluster creation completed ######"

