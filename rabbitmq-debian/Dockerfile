FROM rabbitmq:3.6.10-management

ENV RABBITMQ_AUTOCLUSTER_VERSION=0.8.0-rc1

RUN set -ex; \
    \
    apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates && \
    # Install autocluster plugin
    wget -O "$RABBITMQ_HOME/plugins/autocluster-${RABBITMQ_AUTOCLUSTER_VERSION}.ez" https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/${RABBITMQ_AUTOCLUSTER_VERSION}/autocluster-${RABBITMQ_AUTOCLUSTER_VERSION}.ez && \
    wget -O "$RABBITMQ_HOME/plugins/rabbitmq_aws-${RABBITMQ_AUTOCLUSTER_VERSION}.ez" https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/${RABBITMQ_AUTOCLUSTER_VERSION}/rabbitmq_aws-${RABBITMQ_AUTOCLUSTER_VERSION}.ez && \
    \
    # Enable autocluster plugin
    rabbitmq-plugins enable autocluster --offline

