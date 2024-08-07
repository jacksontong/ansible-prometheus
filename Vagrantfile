Vagrant.configure("2") do |config|
  # Shared SSH Key Configuration
  ssh_key_path = File.expand_path("./ssh/vagrant")

  # Prometheus VM Configuration
  config.vm.define "prometheus" do |prometheus|
    prometheus.vm.box = "generic/debian12"
    prometheus.vm.hostname = "prometheus"
    prometheus.vm.network "private_network", ip: "192.168.60.60"
    prometheus.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2          # Set to use 2 CPUs
      vb.gui = false
    end
    prometheus.ssh.remote_user = ssh_key_path
  end

  # Webserver VM Configuration
  config.vm.define "webserver" do |webserver|
    webserver.vm.box = "generic/debian12"
    webserver.vm.hostname = "webserver"
    webserver.vm.network "private_network", ip: "192.168.60.61"
    webserver.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2          # Set to use 2 CPUs
      vb.gui = false
    end
    webserver.ssh.remote_user = ssh_key_path 
  end
end
