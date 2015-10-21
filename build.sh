#!/bin/bash

# to build devbox-base-v1.1.0.box:
vagrant destroy -f
vagrant up && vagrant halt
rm -f devbox-base-v1.1.0.box
vagrant package --output devbox-base-v1.1.0.box

# to install locally:
# vagrant box add devbox-base-v1.1.0 devbox-base-v1.1.0.box
