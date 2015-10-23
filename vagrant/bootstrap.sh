#!/usr/bin/env bash

locale-gen en_US.UTF-8
dpkg-reconfigure locales

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export DEBIAN_FRONTEND=noninteractive

# Update APT database
apt-get update -y -q && apt-get upgrade -y -q
apt-get install -y -q ubuntu-standard ubuntu-minimal

# Common tools
apt-get install -y -q htop logtail bash-completion python-software-properties build-essential vim-tiny

# SCM tools
apt-get install -y -q git-core subversion mercurial

# Development libraries
apt-get install -y -q libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev
apt-get install -y -q libreadline-dev libncurses-dev libxslt-dev
apt-get install -y -q libpq-dev libmemcached-dev

# Python 2 & 3 packages
apt-get install -y -q python python-dev python-sphinx python-pip
apt-get install -y -q python3 python3-dev python3-sphinx python3-pip

# Deployment tools
apt-get install -y -q python-virtualenv fabric

# PGSQL, Memcached and Redis
apt-get install -y -q postgresql memcached redis

# Node.js, Bower, CoffeeScript and LESS
apt-get install -y -q npm nodejs nodejs-legacy
if ! command -v coffee; then
    npm install -g coffee-script
fi
if ! command -v bower; then
    npm install -g bower
fi
if ! command -v lessc; then
    npm install -g less
fi
