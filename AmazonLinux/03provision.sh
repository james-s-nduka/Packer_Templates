#!/bin/bash
# Necessary packages
yum install net-tools -y

# Install CHEF ver.12.17.44
yum install wget -y
wget https://packages.chef.io/files/stable/chef/12.17.44/el/7/chef-12.17.44-1.el7.x86_64.rpm -O /tmp/chef-12.17.44-1.el7.x86_64.rpm
rpm -ivh /tmp/chef-12.17.44-1.el7.x86_64.rpm

# Necessary Packages for Ansible ver.2.1.2.0
yum install epel-release -y
yum install ansible-2.1.2.0-1.el7 -y

# Cleanup
yum clean all -y
rm -rf /tmp/chef-12.17.44-1.el7.x86_64.rpm 
