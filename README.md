Vagrant Developer Box
=====================

A Vagrant box based on Ubuntu trusty64, with developers tools.

Usage
-----

This box is available on Vagrant cloud (aka Atlas) so can be used by
just setting your base box to ``bashu/devbox``.

To create a new Vagrantfile that uses this box, run the following:
```shell
vagrant init bashu/devbox
```

What's inside
-------------

 - Python 2 & 3 (use virtualenv for virtual environments)
 - PostgreSQL 9.3.x
 - Vim, Git, GCC (with C++ support)
 - Development headers for Python 2 & 3, PostgreSQL and some image libraries (libjpeg, zlib, etc)
 - Node.js, Bower, CoffeeScript and LESS
 - Redis & Memcached

Build instructions
------------------

To generate the .box file:
```shell
./build.sh
```
To install locally:
```shell
vagrant box add devbox-base-v1.1.0 devbox-base-v1.1.0.box
```
