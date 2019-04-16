# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/cosmic64"

  default_shared_folder = "#{ENV.fetch('HOME')}/workspace/garden-runc-release/src/gopath"
  shared_folder = ENV.fetch('LINUX_PLAYGROUND_SHARED_DIR', default_shared_folder)
  config.vm.synced_folder shared_folder, "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'linux-playground'

    require 'etc'
    num_cpus = Etc.nprocessors
    vb.cpus = ENV.fetch('LINUX_PLAYGROUND_CPUS', num_cpus)

    vb.memory = ENV.fetch('LINUX_PLAYGROUND_MEMORY', 2048)
  end

  config.vm.provision "shell", inline: "apt-get update && apt-get install -y python-dev"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
