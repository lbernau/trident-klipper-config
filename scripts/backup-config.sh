#!/bin/bash

### Path to your config folder you want to backup
config_folder=~/klipper_config

push_config(){
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  cd $config_folder
  echo Pushing updates
  git pull -v
  git add . -v
  current_date=$(date +"%Y-%m-%d %T")
  git commit -m "Backup triggered on $current_date" -m "$m1" -m "$m2" -m "$m3" -m "$m4"
  git push
}

push_config
