# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "parallels" do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
  end

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :shell, :path => "vagrant/bootstrap.sh"
  config.vm.provision :shell, :path => "vagrant/purge.sh"

end
