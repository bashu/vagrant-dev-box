vagrant-wagtail-base
====================

A Vagrant box based on Ubuntu trusty32, with the dependencies for developing Wagtail
sites preinstalled.

The Wagtail demo site https://github.com/torchbox/wagtaildemo includes an install
script that will bring up a working site from a vanilla trusty32 base box, but using
vagrant-wagtail-base instead will skip some of the time-consuming initial setup.

Build instructions
------------------
To generate the .box file:

    ./build.sh

To install locally:

    vagrant box add wagtail-base-v1.1 wagtail-base-v1.1.box
