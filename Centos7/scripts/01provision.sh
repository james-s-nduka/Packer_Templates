#!/bin/bash
# Necessary package for netstat
yum install net-tools -y

#Install Golang ver.1.7.1
curl https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz -o /tmp/go1.7.1.linux-amd64.tar.gz
tar -C /usr/local -xzf /tmp/go1.7.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bash_profile

# Install CHEF ver.12.15.19
yum install wget -y
wget https://packages.chef.io/stable/el/7/chef-12.15.19-1.el7.x86_64.rpm -O /tmp/chef-12.15.19-1.el7.x86_64.rpm
rpm -ivh /tmp/chef-12.15.19-1.el7.x86_64.rpm

# Necessary Packages for Ansible ver.2.1.2.0
yum install epel-release -y
yum install ansible-2.1.2.0-1.el7 -y

# Cleanup
yum clean all -y
rm -rf /tmp/chef-12.15.19-1.el7.x86_64.rpm /tmp/go1.7.1.linux-amd64.tar.gz
