Vagrant box for Django site development
=======================================

A Vagrant box based on Ubuntu trusty64, with the dependencies for
developing Django sites preinstalled.

Usage
-----

This box is available on Vagrant cloud (aka Atlas) so can be used by
just setting your base box to ``bashu/djangobox``.

To create a new Vagrantfile that uses this box, run the following:
```shell
vagrant init bashu/djangobox
```

What's inside
-------------

 - Python 2 & 3 (use virtualenv for virtual environments)
 - PostgreSQL 9.3.6
 - Vim, Git, GCC (with C++ support)
 - Development headers for Python 2 & 3, PostgreSQL and some image libraries (libjpeg, zlib, etc)
 - Node.js, Bower, CoffeeScript and LESS

Build instructions
------------------

To generate the .box file:
```shell
./build.sh
```
To install locally:
```shell
vagrant box add django-base-v1.0.0 django-base-v1.0.0.box
```
