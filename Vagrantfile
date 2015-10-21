# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  ## For masterless, mount your file roots file root
  config.vm.synced_folder "saltstack/roots/", "/srv/"

  config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get install -q -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' python-git python-software-properties"
  
  config.vm.provision :salt do |salt|

    salt.bootstrap_options = "-P"
    salt.minion_config = "saltstack/minion.conf"
    salt.pillar({
                  "postgres" => {
                    "pkg_dev" => false,
                    "pkg_libpq_dev" => "libpq-dev",
                    "acls" => [
                      ['local', 'all', 'postgres', 'trust'],
                      ['local', 'all', 'all', 'trust'],
                      ['local', 'all', '127.0.0.1/32', 'trust'],
                    ],
                    "users" => {
                      "vagrant" => {
                        "ensure" => "present",
                        "superuser" => true,
                      },
                    },
                  },
                  "redis" => {
                    "tcp_backlog" => 0,
                  },
                })
    salt.run_highstate = true
    salt.verbose = true

  end  

  config.vm.provision :shell, :inline => "apt-get remove -q -y juju juju-core"
  config.vm.provision :shell, :inline => "apt-get autoremove -q -y"
  config.vm.provision :shell, :inline => "apt-get clean -q"

end
