#!/bin/bash

# to build package.box:
vagrant destroy -f
vagrant up && vagrant halt
rm -f package.box
vagrant package

# to install locally:
# vagrant box add devbox-base-v1.1.0 package.box
