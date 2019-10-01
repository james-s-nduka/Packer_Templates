#!/bin/bash
yum update -y 

# Necessary packages
yum install -y yum-utils device-mapper-persistent-data lvm2 jq
yum install net-tools -y
yum install awslogs -y
yum install git -y

# Install CHEF ver.12.17.44
# yum install wget -y
# wget https://packages.chef.io/files/stable/chef/12.17.44/el/7/chef-12.17.44-1.el7.x86_64.rpm -O /tmp/chef-12.17.44-1.el7.x86_64.rpm
# rpm -ivh /tmp/chef-12.17.44-1.el7.x86_64.rpm

# Install ansible
yum install epel-release -y
pip install ansible

# Install Docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker -y 
sudo systemctl start docker && sudo systemctl enable docker
usermod -aG docker ec2-user

# Cleanup
yum clean all -y
rm -rf /var/cache/yum
# rm -rf /tmp/chef-12.17.44-1.el7.x86_64.rpm 
