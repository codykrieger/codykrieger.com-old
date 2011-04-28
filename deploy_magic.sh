#!/bin/bash

# rvm magic
source "/usr/local/lib/rvm"
DIR=`pwd`
cd ..
cd $DIR

rake deploy:bundle
rake deploy:run_migrations
rake deploy:restart_app

