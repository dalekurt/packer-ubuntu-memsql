# Packer memSQL

Deploy a memSQL server using Packer to VirtualBox, Amazon Web Services and Digital Ocean

## Prerequisites

* [Packer](http://www.packer.io/)
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
* Sign up for [memSQL](http://www.memsql.com/) license

## Getting Started

Let's create a base image using Packer and then test it using Vagrant

Browse to the `packer` directory
`cd packer`

Build a VirtualBox
`./buildbox.sh`


