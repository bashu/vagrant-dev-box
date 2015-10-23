# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder ".", "/vagrant"

  ## For masterless, mount your file roots file root
  config.vm.synced_folder "saltstack/roots", "/srv", :nfs => true

  config.vm.network "private_network", ip: "33.33.33.66"

  config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get install -q -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' python-dulwich"
  
  config.vm.provision :salt do |salt|

    salt.bootstrap_options = "-P"
    salt.minion_config = "saltstack/minion.conf"
    salt.pillar({
                  "postgres" => {
                    "pkg_dev" => false,
                    "pkg_libpq_dev" => "libpq-dev",
                    "users" => {
                      "vagrant" => {
                        "ensure" => "present",
                        "superuser" => true,
                        "password" => "",
                      },
                    },
                  },
                  "redis" => {
                    "tcp_backlog" => 0,
                  },
                  "python" => {
                    "version" => "3",
                  },
                })
    salt.run_highstate = true
    salt.verbose = true

  end  

  config.vm.provision :shell, :path => "vagrant/purge.sh"

end
