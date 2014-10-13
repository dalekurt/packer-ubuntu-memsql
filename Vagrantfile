# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "memsql.local"

  config.vm.box = "memsql"

  config.vm.network "forwarded_port", guest: 80, host: 8888

  config.vm.network "private_network", ip: "192.168.2.100"

  config.vm.synced_folder "./packer/puppet", "/home/vagrant/.puppet"
  config.vm.synced_folder "./tmp", "/home/vagrant/tmp"
  config.vm.synced_folder "~/Sites/localdebs.dev", "/home/vagrant/www"
  
end
