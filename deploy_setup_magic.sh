#!/bin/bash

# common
./deploy_magic.sh

rake deploy:create_rails_dirs
rake deploy:bundle
rake deploy:symlinkage

