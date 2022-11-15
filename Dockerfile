FROM hashicorp/terraform

RUN apk add --no-cache --upgrade bash
RUN apk add jq

ENV SLEEP_DURATION 5s
ENV MODULE_NAME

COPY build.sh .
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/$MODULE_NAME
ADD elasticache.tf /opt/buildpiper/$MODULE_NAME
ADD variable.tf /opt/buildpiper/$MODULE_NAME

ENV ACTIVITY_SUB_TASK_CODE TF_ELASTICACHE_EXECUTE
ENV INSTRUCTION "apply"

ENTRYPOINT [ "./build.sh" ]
