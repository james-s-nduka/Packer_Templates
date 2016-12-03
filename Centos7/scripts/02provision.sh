#!/bin/bash
# Necessary packages
yum install net-tools -y
yum install unzip -y
yum install python -y
yum install wget -y

#Install AWS CLI
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -O /tmp/awscli-bundle.zip
unzip /tmp/awscli-bundle.zip 
awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
echo 'PATH=$PATH:/usr/local/bin/' >> ~/.bashrc
export PATH=$PATH:/usr/local/bin/

#Install Packer
wget https://releases.hashicorp.com/packer/0.12.0/packer_0.12.0_linux_amd64.zip -O /tmp/packer_0.12.0_linux_amd64.zip
unzip /tmp/packer_0.12.0_linux_amd64.zip -d /root/packer
echo 'PATH=/root/packer/:$PATH' >> ~/.bashrc

#Install Terraform
wget https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip -O /tmp/terraform_0.7.13_linux_amd64.zip
unzip /tmp/terraform_0.7.13_linux_amd64.zip -d /root/terraform
echo 'PATH=/root/terraform/:$PATH' >> ~/.bashrc

#Install ChefDK
wget https://packages.chef.io/stable/el/7/chefdk-1.0.3-1.el7.x86_64.rpm -O /tmp/chefdk-1.0.3-1.el7.x86_64.rpm
rpm -Uvh /tmp/chefdk-1.0.3-1.el7.x86_64.rpm
aws s3 cp s3://syndicate-devops/chef/knife.rb /opt/chef-repo/.chef/knife.rb
aws s3 cp s3://syndicate-devops/chef/synwin-cloud-validator.pem /opt/chef-repo/.chef/synwin-cloud-validator.pem
aws s3 cp s3://syndicate-devops/chef/administrator.pem /opt/chef-repo/.chef/administrator.pem

cd /opt/
chef generate app chef-repo
#echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc
echo 'PATH=$PATH:/opt/chefdk/embedded/bin/' >> ~/.bash_profile

#Install Java 7
yum install java -y

rm -rf /tmp/*.zip /tmp/*.rpm
