#!/usr/bin/env bash

set -eux
source .env

if [ $SKIP_MASTER != "true" ] ; then
    k3sup install --ip $MASTER --user $SSH_USER --ssh-key $SSH_KEY
fi

for node in $NODES ; do
    k3sup join --ip $node --server-ip $MASTER --user $SSH_USER --ssh-key $SSH_KEY
done

export KUBECONFIG=$(pwd)/kubeconfig
kubectl get node
