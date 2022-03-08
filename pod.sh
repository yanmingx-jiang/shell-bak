#!/bin/bash
[[ $# == 0 ]] && echo "Usage: $0 POD_NAME namespace" && exit 1
# find tha container id
echo "Pod: $1, Namespace: ${2:-default}"
contain_sock=$(kubectl get po $1 -n ${2:-default} -o template --template='{{range .status.containerStatuses}}{{.containerID}}{{end}}')
containerID=${contain_sock##*/}
# get the pid of container
pid=$(docker inspect -f {{.State.Pid}} $containerID)
echo "$1 PID is: $pid"
# enter the namesapce of container
nsenter -n -t $pid
