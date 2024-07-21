# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Use the Debian 12 (Bookworm) image
  config.vm.box = "generic/debian12"

  # Forward a port from the guest VM to the host machine (optional)
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Configure a private network with a specific IP
  config.vm.network "private_network", ip: "192.168.60.60"

  # Customize the amount of memory and CPU on the VM
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = "1024"
    vb.gui = false  # Disable GUI
    vb.name = "docker-vm"
  end

  # Enable provisioning with an external shell script
  config.vm.provision "shell", path: "provision.sh"
end
