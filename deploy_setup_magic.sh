#!/bin/bash

# rvm magic
source "/usr/local/lib/rvm"
DIR=`pwd`
cd ..
cd $DIR

bundle install --deployment
rake deploy:create_rails_dirs
rake deploy:symlinkage

