#!/bin/bash

#step1 : UPDATING UBUNTU MACHINE

sudo apt update

#step 2: Installing  AMAZON CLI
 #COMMAND 1:

        sudo  apt install zip -y

 #COMMAND 2:

        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

 #COMMAND 3:

        unzip awscliv2.zip

 #COMMAND 4:

        sudo ./aws/install

 #AWS CLI INSTALLATION COMPLETED
        echo "#####***** AWAS CLI INSTALALTION COMPLETED *****#####"
 #COMMAND FOR AWS CLI CHECKING

        aws --version
 #AWS CONFIGURATION AND CREDENTIALS

        aws configure

#STEP 2:

#INSTALLATION OF KUBERNETES CONTROLLER

 #COMMAND 1:

        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

 #COMMAND 2:

        curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

 #COMMAND 3:

        echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

 #COMMAND 4:
 

        sudo ./aws/install

#AWS CLI INSTALLATION COMPLETED
        echo "#####***** AWAS CLI INSTALALTION COMPLETED *****#####"
  #COMMAND FOR AWS CLI CHECKING

        aws --version
 #AWS CONFIGURATION AND CREDENTIALS

        aws configure

#STEP 2:

#INSTALLATION OF KUBERNETES CONTROLLER

  #COMMAND 1:

        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

  #COMMAND 2:

        curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

  #COMMAND 3:

        echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

  #COMMAND 4:

        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

  #COMMAND 5:

        chmod +x kubectl

  #COMMAND 6:

        mkdir -p ~/.local/bin

  #COMMAND 7:

        mv ./kubectl ~/.local/bin/kubectl


#KUBECONTROLLER INSTALLATION COMPLETED

        kubectl version --client

 echo "#####***** KUBECTL INSTALLED *****#####"


#STEP 4:

 #INSTALLING EKS CLUSTER

 #COMMAND 1:

        # for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH


  #COMMAND 2:

        curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

  #COMMAND 3:

   #(Optional) Verify checksum
        curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

  #COMMAND 4:

        tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

  #COMMAND 5:

        sudo mv /tmp/eksctl /usr/local/bin

#EKS INSTALLATION HAS COMPLETED

        echo" ##########***** EKS DEPENCIES INSTALLION COMPLETED *****##########"

  #COMMAND 6:

        eksctl version



#STEP :5


#ELASTIC KUBERNETES CLUSTER CREATION BY CLOUD FORMATION SCRIPT


  #COMMAND 1:

        eksctl create cluster --name=demoCLUSTER --region=us-east-1 --zones=us-east-1a,us-east-1b --without-nodegroup



   echo "################################################################################################################################################


     ++++++++++++++++++++++++++++++++===============    CLUSTER HAS CREATED   ===============+++++++++++++++++++++++++++++++++++++++++++++++++++++      "



#STEP :6


 #ELASTIC KUBERNETES CLUSTER CREATION BY IAM AUTHENTICATOR OR IODC PROVIDER

 COMMAND :

        eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster demoCLUSTER --approve

#STEP :7

 #ELASTIC KUBERNETS CLUSTER NODE GROUP CREATION

  #COMMAND 1:

        eksctl create nodegroup --cluster=demoCLUSTER \
                       --region=us-east-1 \
                       --name=BOOkS \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=teja2 \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access


#ELASTIC KUBERNETS CLUSTER NODES HAS  BEEN CREATED


echo "#############################################################################################################################################################


###################************************************CLUSTER SETUP HAS BEEN COMPLETED*****************************************###################################


##################################################################################################################################################################"
                       
