#! /bin/bash

cfg_path=$1

nl='
'

hwdirsubpath="hardware"
hwexcludefilter="loop\|CoE\|stepDirectionDrive\|AnalogOutput\|AnalogInput\|EX\|WatchDog\|XXXX"
hwextension=".cmd"

source $cfg_path

ALLFILES=""
for dir in "${dirs[@]}"; do    
    FILES=$(find $ecmccfgpath/$hwdirsubpath/$dir/ -type f -name "*.cmd" | grep -v $hwexcludefilter)
    ALLFILES="$ALLFILES$nl$FILES "
done
# Filter out filenames
ALLFILES=$(echo "$ALLFILES" | tr '/' ' ' | awk '{print $NF}' | grep "ecmc" | grep $hwextension)

# Remove "ecmc" and ".cmd"
ALLFILES=$(echo "$ALLFILES" | cut -c 5- | rev | cut -c 5- | rev)

#echo "$ALLFILES "

# Generate hw snippet fro all supported hardware
echo "$ALLFILES " | awk -v pfix=$prefix -v name=$naming ' BEGIN{i=100;} {print "${SCRIPTEXEC}\"${ecmccfg_DIR}/ecmc" name ".cmd\" \"MASTER_ID=0,SLAVE_POS=" i ",HWTYPE=" $1"\""; print "dbLoadTemplate(ecmc" $1 ".substitutions,\"ECMC_P=${ECMC_P},ECMC_G=${ECMC_G},PORT=MC_CPU1,ADDR=0,TIMEOUT=1,MASTER_ID=0,SLAVE_POS=" i ",HWTYPE=" $1 ",T_SMP_MS=10,TSE=-2,NELM=1\")"; i=i+1;}'
echo "dbLoadRecords(\"ecmcEcSlave.template\", \"ECMC_P=\${ECMC_P},ECMC_G=\${ECMC_G},PORT=MC_CPU1,ADDR=0,TIMEOUT=1,MASTER_ID=0,SLAVE_POS=0,HWTYPE=EK1100,T_SMP_MS=10,TSE=-2,\")"


#iocshLoad "/home/iocuser/epics/base-7.0.5/require/3.4.0/siteMods/ecmccfg/7.0.1/ecmcESSnaming.cmd" "MASTER_ID=0,SLAVE_POS=0,HWTYPE=EK1100"



