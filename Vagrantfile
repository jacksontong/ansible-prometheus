# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Load port mappings from external file
  require_relative 'port_mappings'
  require_relative 'synced_folders'

  # Use the Debian 12 (Bookworm) image
  config.vm.box = "generic/debian12"

  # Loop through the port mappings and set up port forwarding
  PORT_MAPPINGS.each do |guest, host|
    config.vm.network "forwarded_port", guest: guest, host: host
  end

  SYNCED_FOLDERS.each do |host, guest|
    config.vm.synced_folder host, guest
  end

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
