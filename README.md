# Minishift Installation

Tested on Vmware Workstation v12 (check the 3 virtualization engines under the vcpu of vm centos7) and Centos7-physical (Venerari tested on Centos 7 laptop and Lazaroall tested on Vmware Workstation 12).  We run minishift with 4 vcpu, 12GB ram and 100GB disk, we don't know the limit.  

***Make sure your centos7 is server-gui when you select the installation for you need to run the minishift on the browser inside the vm. It's up to you later when you want to change this to bridge with kvm and make centos to no gui.***

***This will only take about 10-15 min if you are using SSD including vm provisioning***

The resources arguments for vcpu/ram/disk can be change on group_vars/all, please change it according to your resources.

***You should not proceed if your vm or physical computer is not capable of virtualization by running "grep -E '(vmx|svm)' /proc/cpuinfo", it should output either vmx or svm.***

Do these after the vm had been provisioned,

1. Create the centos7 repo but login as root first

$ vi /etc/yum.repos.d/centos.repo

[centos]<br />
name=CentOS $releasever - $basearch<br />
baseurl=http://mirror.centos.org/centos/7/os/$basearch/<br />
enabled=1<br />
gpgcheck=1<br />
gpgkey=http://mirror.centos.org/centos/7/os/$basearch/RPM-GPG-KEY-CentOS-7

2. Clean yum

$ yum clean all

3. Install software

 $ yum install epel-release
 
 $ yum update -y
 
 $ yum install gcc make kernel-devel -y
 
 $ reboot<br /> 
 ***it's important to reboot after kernel-devel installation***
 
 $ yum install git ansible -y
  
4. Established ssh
 
 $ ssh-keygen     
 ***enter/enter/enter***
 
 $ ssh-copy-id localhost           
 ***type yes and put the root password***
 
5. Clone this repository

 $ git clone https://github.com/tso-ansible/minishift.git
 
 $ cd minishift/
 
6. Run ansible-playbook

 $ ansible-playbook -i inventory minishift.yml
 
7. Sorry the output is not accurate but to see the URL, run from shell "oc login" and it should show it and then you could go to your centos7 firefox and login on it.

***The minishift is sensitive, installing any other software will break it.***

# Created by Venerari and Lazaroall.
