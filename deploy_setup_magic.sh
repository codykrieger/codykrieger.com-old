#!/bin/bash

# rvm magic
source "/usr/local/lib/rvm"
DIR=`pwd`
cd ..
cd $DIR

rake deploy:create_rails_dirs
rake deploy:bundle
rake deploy:symlinkage

