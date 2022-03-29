#! /bin/bash

cfg_path=$1

source $cfg_path

# Add pre
bash ecmc_add_pre.bash $cfg_path 

# Add hardware
bash ecmc_add_hw.bash $cfg_path

