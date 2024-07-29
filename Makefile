gen-ssh:
	mkdir -p ssh
	ssh-keygen -t ed25519 -f ./ssh/vagrant -N ""

ansible-play:
	ansible-playbook -i ./ansible/inventory.yaml ./ansible/playbook.yaml

ansible-ping:
	ansible-playbook -i ./ansible/inventory.yaml ./ansible/ping.yaml