#!/bin/bash

# Need to fix locale so that Postgres creates databases in UTF-8
cp -p /srv/etc/bash.bashrc /etc/bash.bashrc
locale-gen en_US.UTF-8
dpkg-reconfigure locales

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export DEBIAN_FRONTEND=noninteractive

# Update APT database
apt-get update -y
apt-get upgrade -y

# Useful tools
apt-get install -y vim git-core fabric python-virtualenv gettext build-essential

# Python Imaging Library
apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev

# Python 2 & 3 packages
apt-get install -y python python-dev python-sphinx python-pip
apt-get install -y python3 python3-dev python3-sphinx python3-pip

# PostgreSQL
if ! command -v psql; then
    apt-get install -y postgresql libpq-dev
    cp /srv/etc/postgresql/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
    /etc/init.d/postgresql reload
fi

# Create vagrant pgsql superuser
su - postgres -c "createuser -s vagrant"

# bash environment global setup
cp -p /srv/etc/bashrc /home/vagrant/.bashrc

# Node.js, Bower, CoffeeScript and LESS
if ! command -v npm; then
    apt-get install -y npm nodejs nodejs-legacy
fi
if ! command -v coffee; then
    npm install -g coffee-script
fi
if ! command -v bower; then
    npm install -g bower
fi
if ! command -v lessc; then
    npm install -g less
fi

# Remove some large packages that we don't need
apt-get remove -y juju juju-core
apt-get autoremove -y

# Cleanup
apt-get clean

echo "Zeroing free space to improve compression..."
dd if=/dev/zero of=/EMPTY bs=1M 2>/dev/null
rm -f /EMPTY
