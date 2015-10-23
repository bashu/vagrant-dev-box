#!/bin/bash

# Credits to:
#  - http://vstone.eu/reducing-vagrant-box-size/
#  - https://github.com/mitchellh/vagrant/issues/343
#  - https://gist.github.com/adrienbrault/3775253

aptitude -y purge installation-report landscape-common wireless-tools wpasupplicant update-notifier-common
aptitude -y purge juju juju-core

# Remove APT cache
apt-get clean -y
apt-get autoclean -y

# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Remove bash history
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[ -f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;
