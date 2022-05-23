# Ansible playbook for a microk8s cluster and container registry

When trying to run a microk8s cluster with amd64/arm64 machines it became difficult to use the
builtin container registry. This playbook is my solution.

## WARNINGS
This is **only** for testing on a **local network** with no bad actors. Anyone on the network can push to the 
container registry. I would not leave it running for extended periods of time.

I suggest you **read the Makefile** before running it, simply typing `make` will suggest the same.

It will overwrite `~/.kube/config` and simply runs `mv -i`.

`scripts/add-nodes` will add the nodes to the cluster. Domain names are hardcoded there,
they are not read from the inventory.

