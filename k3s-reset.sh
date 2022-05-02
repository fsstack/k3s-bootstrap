#!/usr/bin/env bash
set -eux
source .env

for node in $NODES ; do
    ssh $node "sudo k3s-agent-uninstall.sh && sudo reboot &"
done

ssh $MASTER "sudo k3s-uninstall.sh && sudo reboot &"

rm -f kubeconfig
