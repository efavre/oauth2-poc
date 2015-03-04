# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"
  config.vm.network "forwarded_port", guest: 3001, host: 3001, auto_correct: true
  config.vm.network "forwarded_port", guest: 3003, host: 3003, auto_correct: true

  config.vm.provision "shell", path: "init_puppet.sh"
  config.vm.provision "puppet"
  config.vm.provision "shell", path: "start_rails.sh"

end
