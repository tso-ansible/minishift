
#!/bin/bash

if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen -q -f ~/.ssh/id_rsa -N ""
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	ssh -o StrictHostKeyChecking=no localhost "pwd" < /dev/null
fi


yum install git ansible -y

cd /tmp

clone https://github.com/tso-ansible/minishift.git

cd /tmp/minishift/

ansible-playbook -i inventory minishift.yml

echo "type oc login on your shell"
