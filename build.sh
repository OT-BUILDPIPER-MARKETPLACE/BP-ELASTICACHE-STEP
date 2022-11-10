#!/bin/bash
source /opt/buildpiper/shell-functions/functions.sh
source /opt/buildpiper/shell-functions/log-functions.sh

logInfoMessage "I'll create/update RDS whose properties are available at [$WORKSPACE] and have mounted at [$CODEBASE_DIR]"
sleep  "$SLEEP_DURATION"

cd  "$WORKSPACE"/"${CODEBASE_DIR}"
cp /opt/buildpiper/elasticache.tf .

logInfoMessage "Running below tf command"
logInfoMessage "terraform $INSTRUCTION"

terraform init
terraform "$INSTRUCTION"
