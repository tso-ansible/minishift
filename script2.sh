yum install git ansible -y

cd /tmp

clone https://github.com/tso-ansible/minishift.git

cd /tmp/minishift/

ansible-playbook -i inventory minishift.yml

echo "type oc login on your shell"
