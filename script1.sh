#!/bin/bash

curl -o  /etc/yum.repos.d/centos.repo https://raw.githubusercontent.com/tso-ansible/ansible-tower/master/centos.repo

curl -o  /usr/local/sbin/script2.sh https://raw.githubusercontent.com/venerari/minishift/master/script2.sh

chmod u+x /usr/local/bin/script2.sh

yum clean all

yum install epel-release -y

yum update -y

yum install gcc make kernel-devel -y

echo "This will reboot now, unfortunately after reboot, it should continue to install on the background."
echo "Check the /tmp/minishitisdone file existence.  If it does not exist, it is not done, you may also check"
echo "the second script on the process ps -ef script2.sh"

sleep 10

reboot
