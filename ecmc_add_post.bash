#! /bin/bash

# source config
source $1

# Print end of statrtup file
echo "\$(SCRIPTEXEC) (\$(ecmccfg_DIR)setAppMode.cmd)"
echo "iocInit"
echo "dbl > $outputfile"

#dbLoadRecords("ecmcGeneral.db","P=IOC_TEST:,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,T_SMP_MS=10,TSE=-2,ECMC_PROC_HOOK=")
# dbLoadRecords("ecmcEc.db","P=IOC_TEST:,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,MASTER_ID=0,T_SMP_MS=10,TSE=-2")
