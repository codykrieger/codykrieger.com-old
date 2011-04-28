#!/bin/bash

# common
./deploy_magic.sh

rake deploy:bundle
rake deploy:run_migrations
rake deploy:restart_app

