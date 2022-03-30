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

echo "$ALLFILES " | awk 'BEGIN{i=0;} {print "${SCRIPTEXEC} ${ecmccfg_DIR}addSlave.cmd, \"SLAVE_ID=" i ", HW_DESC=" $1 "\""; i=i+1}'

echo "ecmcConfigOrDie \"Cfg.EcApplyConfig(1)\""


#dbLoadTemplate(ecmcEK1100.substitutions,"ECMC_P=IOC_TEST:#m0s000-,ECMC_G=IOC_TEST:#m0s000,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,MASTER_ID=0,SLAVE_POS=0,HWTYPE=EK1100,T_SMP_MS=10,TSE=-2,NELM=1")
#dbLoadRecords("ecmcEcSlave.template", "ECMC_P=IOC_TEST:#m0s000-,ECMC_G=IOC_TEST:#m0s000,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,MASTER_ID=0,SLAVE_POS=0,HWTYPE=EK1100,T_SMP_MS=10,TSE=-2,")


