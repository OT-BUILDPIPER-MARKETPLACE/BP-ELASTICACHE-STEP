FROM hashicorp/terraform

RUN apk add --no-cache --upgrade bash
RUN apk add jq

ENV SLEEP_DURATION 5s
COPY build.sh .
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/
ADD elasticache.tf /opt/buildpiper/
ADD variable.tf /opt/buildpiper/

ENV ACTIVITY_SUB_TASK_CODE TF_RDS_EXECUTE
ENV INSTRUCTION apply

ENTRYPOINT [ "./build.sh" ]
