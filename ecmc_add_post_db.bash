#! /bin/bash

# source config
source $1

# Print end of statrtup file
echo "dbLoadRecords(\"ecmcGeneral.db\",\"P=${prefix}:,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,T_SMP_MS=10,TSE=-2,ECMC_PROC_HOOK=\")"
echo "dbLoadRecords(\"ecmcEc.db\",\"P=${prefix}:,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,MASTER_ID=0,T_SMP_MS=10,TSE=-2\")"
echo "iocInit()"
echo "epicsThreadSleep(1)"
echo "dbl > $outputfile"
echo "dbpf \${REQUIRE_IOC}:exit 1"
echo "epicsThreadSleep(1)"
