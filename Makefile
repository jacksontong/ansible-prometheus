gen-ssh:
	mkdir -p ssh
	ssh-keygen -t ed25519 -f ./ssh/vagrant -N ""