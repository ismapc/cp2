#!/bin/bash
ansible-playbook --ask-vault-pass -i inventory 01_playbook.yml
ansible-playbook --ask-vault-pass -i inventory 02_playbook.yml
