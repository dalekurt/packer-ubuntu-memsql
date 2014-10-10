#!/bin/bash

set -e

#export PACKER_LOG=1
rm memsql-ubuntu-14-04-x64-virtualbox.box || true
packer build -only=virtualbox-iso template.json
vagrant box remove memsql || true
vagrant box add memsql memsql-ubuntu-14-04-x64-virtualbox.box
