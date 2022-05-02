# K3S Bootstrap with K3sup
Scripts to bootstrap a k3s cluster using k3sup.


## Requirements
* [k3sup](https://github.com/alexellis/k3sup)
* SSH access to nodes
* [sudo w/o password](https://github.com/alexellis/k3sup#pre-requisites-for-k3sup-servers-and-agents)
* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

## Steps
1. Configure `.env` file. The scripts source that file for various settings. Copy the `.evn.example` and update the values to match your setup.
2. Run the install script `./k3sup-bootstrap.sh`. This will setup k3s on the master node, any agent nodes you might have, and write out the kubeconfig file to the local directory.

## Reset Nodes
If you need or want to reset your nodes (aka remove k3s) you can run the `k3s-reset.sh` script. This will ssh to each node and run the `k3s-uninstall.sh` script and reboot the nodes.

## Limitations
* Bootstrap script is not idempotent. If you re-run it likely cause problems.
* Script assumes you have 1 master and at least 1 agent node.
