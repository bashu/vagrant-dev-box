#!/bin/bash

# to build django-base-v1.0.0.box:
vagrant destroy -f
vagrant up && vagrant halt
rm -f django-base-v1.0.0.box
vagrant package --output django-base-v1.0.0.box

# to install locally:
# vagrant box add django-base-v1.0.0 django-base-v1.0.0.box
