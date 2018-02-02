#!/bin/bash

curl -o  /etc/yum.repos.d/centos.repo https://raw.githubusercontent.com/tso-ansible/ansible-tower/master/centos.repo

yum clean all

yum install epel-release -y

yum update -y

yum install gcc make kernel-devel -y


reboot

