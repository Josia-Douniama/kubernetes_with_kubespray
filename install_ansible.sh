#!bin/bash
sudo apt update
sudo apt install pip curl gnupg2 wget python3 python3-pip -y
#uninstall ansible
pip uninstall ansible
#adding the repo ansible
sudo echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" >> /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 93C4A3FD7BB9C367
#installing ansible
sudo apt update
sudo apt install ansible -y
ansible --version
echo "Ansible has been well installed..."
#setting up the ansible inventory file
ip=`hostname -I|cut -d " " -f 1`
hostname=cat /etc/hostname
echo "[masters]" >> ~/hosts
echo "$hostname ansible_host=$ip ansible_user=root" >> ~/hosts
export ANSIBLE_INVENTORY=~/hosts
#confirm installation of ansible
ansible all -m ping
