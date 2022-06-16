#! /bin/bash

cfg_path=$1

source $cfg_path

# Add pre
stfile=$(bash ecmc_generate_st_file_db.bash $cfg_path)

echo "$stfile" > st.cmd

#Run ioc
ioclog=$($iocsh_exe_cmd st.cmd)

echo "$ioclog" >ioc.log

# check pvs
length=$(expr length $prefix)

# remove prefix for length check
property=$(cat pvs.log | cut -c $length- | cut -c 3-)

echo "List of PVs breaking length rule:"
echo "$property" | awk -v maxl=$maxproplength '{len=length($1); if(len>maxl) {print $0 ": PV property to long (" len " > " maxl" chars)";}}'
