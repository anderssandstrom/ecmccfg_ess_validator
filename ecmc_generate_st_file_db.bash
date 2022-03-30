#! /bin/bash

cfg_path=$1

source $cfg_path

# Add pre
bash ecmc_add_pre_db.bash $cfg_path 

# Add hardware
bash ecmc_add_hw_db.bash $cfg_path

# Add motion
bash ecmc_add_motion_db.bash $cfg_path

# Add post
bash ecmc_add_post_db.bash $cfg_path
