# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "nginx" do |d| 
    d.vm.box = "bento/centos-7.3"
    d.vm.hostname = "nginx"
    d.vm.network "public_network", bridge: "eno4", ip: "192.168.57.19", auto_config: "false", netmask: "255.255.255.0" , gateway: "192.168.57.1"    
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs.sh"
  end 
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
    config.vbguest.no_install = false
    config.vbguest.no_remote = false
  end
end
