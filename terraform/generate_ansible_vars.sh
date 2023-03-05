#!/bin/bash

web_username=$(terraform output -raw webserver_username)
ansible_host=$(terraform output -raw public_ip_address)
registry=$(terraform output -raw acr_login_server)
username=$(terraform output -raw acr_username)
password=$(terraform output -raw acr_password)
cluster=$(terraform output -raw aks_name)

echo "#Variables extraidas de terraform usando generate_ansible_vars.sh" > ../ansible/vars/terraform.yml
echo "vm_user: $web_username" >> ../ansible/vars/terraform.yml
echo "vm_ip: $ansible_host" >> ../ansible/vars/terraform.yml
echo "aks_cluster: $cluster" >> ../ansible/vars/terraform.yml
echo "acr: $registry" >> ../ansible/vars/terraform.yml
echo "acr_user: $username" >> ../ansible/vars/terraform.yml

ansible-vault encrypt_string --ask-vault-password "$password" --name 'acr_password' >> ../ansible/vars/terraform.yml

terraform output -raw kubeconfig > ../ansible/aks/kubeconfig

echo "[webserver]"   > ../ansible/inventory
echo "$ansible_host" >> ../ansible/inventory

echo "inventory"
echo "----------"
cat ../ansible/inventory

echo ""
echo "terraform.yml"
echo "----------"
cat ../ansible/vars/terraform.yml

echo ""
echo ""
echo "AKS"
echo "----------"
ls -l ../ansible/aks/

