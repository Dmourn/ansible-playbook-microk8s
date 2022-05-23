
KUBE_CONFIG_PATH=./kube.config/control-plane-ubuntu.local/var/snap/microk8s/current/credentials/client.config

help:
	@printf "\nRead the makefile, you will need to edit the path if you change the hostnames \n\n"

# ansible (possibly) opens a subshell shadowing the inventory env var I have set in bashrc
# I would expect it to be overridden from ./ansible.cfg

run-playbook:
	@ansible-playbook -i inventory/hosts playbook.yml
	@./scripts/edit-config
	@chmod 400 ${KUBE_CONFIG_PATH}
	@echo -e "\e[91mThis will ask to overwrite the default config\e[0m"
	mv -i ${KUBE_CONFIG_PATH} ~/.kube/config
	@rm ./control-plane-address
	@printf "\nYou may now run script/add-nodes.sh if you so desire.\nOtherwise nodes must be added manually"

shutdown:
	ansible all -i inventory/hosts -m community.general.shutdown
	
clean:
	@rm -rfv kube.config
