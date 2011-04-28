#!/bin/bash

# rvm magic
source "/usr/local/lib/rvm"
DIR=`pwd`
cd ..
cd $DIR

bundle install --deployment
rake deploy:run_migrations
rake deploy:restart_app

