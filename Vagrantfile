# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vcloud")
    config.vm.provider :vcloud do |vcloud|
      vcloud.vapp_prefix = "ddc"
      vcloud.ip_subnet = "192.168.32.0/255.255.255.0"
    end
    if Vagrant.has_plugin?("vagrant-proxyconf")
      config.vm.provider :vcloud do |cloud, override|
        override.proxy.enabled = false
      end
    end
    config.vm.provider :vcloud do |cloud, override|
      override.vm.usable_port_range = 2200..2999
    end
  end

  config.vm.define :"ucp-1" do |cfg|
    cfg.vm.box = "ubuntu1404"
    cfg.vm.hostname = "ucp-1"
    cfg.vm.provision "shell", path: "scripts/install-docker-cs.sh"
    cfg.vm.provision "shell", path: "scripts/install-ucp.sh"
    cfg.vm.network :forwarded_port, guest: 443, host: 443, id: "ucp", auto_correct: true
    cfg.vm.provider "vcloud" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end

  config.vm.define :"win01" do |cfg|
    cfg.vm.box = "windows_2016_docker"
    cfg.vm.hostname = "win01"
    cfg.vm.provider "vcloud" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end
end
