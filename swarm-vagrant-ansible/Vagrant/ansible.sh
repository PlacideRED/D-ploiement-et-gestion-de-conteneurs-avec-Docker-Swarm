#!/bin/bash

# mise à jour des paquets
sudo apt-get update

# Installation dependances
sudo apt-get install -y python3-pip sshpass
sudo -H pip3 install --upgrade pip

# Installation Ansible
sudo -H pip install ansible

# exécution des playbooks Ansible
echo -e "\nRUNNING ANSIBLE [cluster.yml] **************************************************\n"
ansible-playbook -i hosts cluster.yml
echo -e "\nRUNNING ANSIBLE [master.yml] ***************************************************\n"
ansible-playbook -i hosts master.yml
echo -e "\nRUNNING ANSIBLE [join.yml] *****************************************************\n"
ansible-playbook -i hosts join.yml
