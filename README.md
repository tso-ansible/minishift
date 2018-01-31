# Minishift Installation

Tested on Vmware Workstation v12 (check the 3 virtualization engines under the vcpu of vm centos7) and Centos7-physical (Venerari tested on Centos 7 laptop and Lazaroall testedon Vmware Workstation 12).  We run minishift with 4 vcpu, 12GB ram and 100GB disk, we don't know the limit.  ***Make sure your centos7 is server-gui when you select the installation for you need to run the minishift on the browser inside the vm.***

The resources arguments for vcpu/ram/disk can be change on group_var/all, please change it according to your resources.

***You should not proceed if your vm or physical computer is not capable of virtualization by running "grep -E '(vmx|svm)' /proc/cpuinfo", it should output either vmx or svm.***

Do these after the vm had been provisioned,

1 create the centos7 repo

vi /etc/yum.repos.d/centos.repo

[centos]

name=CentOS $releasever - $basearch

baseurl=http://mirror.centos.org/centos/7/os/$basearch/

enabled=1

gpgcheck=1

gpgkey=http://mirror.centos.org/centos/7/os/$basearch/RPM-GPG-KEY-CentOS-7


2 Clean yum

yum clean all

3 Install software

 yum install epel-release
 
 yum update -y
 
 yum install gcc make kernel-devel -y
 
 reboot 
 ***its important to reboot after kernel-devel installation***
 
 yum git ansible -y
 
4 login to root if you haven't login 
 
5 established ssh
 
 ssh-keygen (enter/enter/enter)
 
 ssh-copy-id localhost (type yes and put the root password)
 
6 Clone this repository
 git clone https://github.com/tso-ansible/minishift.git
 cd minishift/
 
7 Run ansible-playbook
 ansible-playbook -i inventory minishift.yml
 
8 Sorry the output is not accurate but to see the URL, run from shell "oc login" and it should show it and then you could go to your centos7 firefox and login on it.

# Created Venerari and Lazaroall.
