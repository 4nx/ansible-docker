FROM alpine:3.10.1
MAINTAINER Simon Krenz <sk@4nx.io>

LABEL Description="ansible-docker container for cli interaction"

ENV ANSIBLE_SSH_ARGS="-i /etc/ansible/keys/ansible_key"
ENV ANSIBLE_SSH_ARGS="-o UserKnownHostsFile=/etc/ansible/keys/known_hosts $ANSIBLE_SSH_ARGS"

RUN apk --no-cache add git py2-pip py-paramiko py-crypto py-pexpect py2-pexpect perl rsync openssh sshpass openssl curl && \
    rm -rf /var/cache/apk/* && \
    pip install ansible && \
    mkdir -p /etc/ansible && \
    echo "[local]" > /etc/ansible/hosts; echo "localhost ansible_ssh_host=172.17.0.1" >> /etc/ansible/hosts

WORKDIR /etc/ansible

CMD ["/bin/sh"]
