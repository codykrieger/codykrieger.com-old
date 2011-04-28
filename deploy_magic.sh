#!/bin/bash

# rvm magic
source "/usr/local/lib/rvm"
DIR=`pwd`
cd ..
cd $DIR

bundle install
rake deploy:run_migrations
rake deploy:restart_app

