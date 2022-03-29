
ecmccfg_path=$1
cfg_path=$2
nl='
'

hwdirsubpath="hardware"
hwexcludefilter="loop\|CoE\|stepDirectionDrive\|AnalogOutput\|AnalogInput\|EX\|WatchDog\|XXXX"
hwextension=".cmd"
source $cfg_path
let i=1
ALLFILES=""
for dir in "${dirs[@]}"; do   
    FILES=$(find $ecmccfg_path/$hwdirsubpath/$dir -type f -name "*.cmd" | grep -v $hwexcludefilter)
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
