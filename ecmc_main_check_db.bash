#! /bin/bash

cfg_path=$1

source $cfg_path

# Add pre
stfile=$(bash ecmc_generate_st_file_db.bash $cfg_path)

echo "$stfile" > st.cmd

#Run ioc
ioclog=$(iocsh.bash st.cmd)

# check pvs
cat pvs.log
