#! /bin/bash

# source config
source $1

# Print end of statrtup file
echo "\$(SCRIPTEXEC) (\$(ecmccfg_DIR)setAppMode.cmd)"
echo "iocInit"
echo "dbl > $outputfile"
