#!/bin/bash
source /opt/buildpiper/shell-functions/functions.sh
source /opt/buildpiper/shell-functions/log-functions.sh

logInfoMessage "I'll create/update RDS whose properties are available at [$WORKSPACE] and have mounted at [$CODEBASE_DIR]"
sleep  "$SLEEP_DURATION"

cd  "$WORKSPACE"/"${CODEBASE_DIR}"
cp /opt/buildpiper/elasticache.tf .
cp /opt/buildpiper/variable.tf .

logInfoMessage "Running below tf command"
logInfoMessage "terraform $INSTRUCTION"

terraform init
case "$INSTRUCTION" in

  plan)
    terraform plan -var-file="terraform.tfvars"
    TASK_STATUS=$?
    ;;

  apply)
    terraform apply -auto-approve -var-file="terraform.tfvars"
    TASK_STATUS=$?
    ;;

  destroy)
    terraform destroy -auto-approve -var-file="terraform.tfvars"
    TASK_STATUS=$?
    ;;

  *)
    logInfoMessage "Not a valid option"
    TASK_STATUS=1
    ;;
esac

saveTaskStatus ${TASK_STATUS} ${ACTIVITY_SUB_TASK_CODE}

