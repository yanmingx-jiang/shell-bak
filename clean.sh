#!/bin/bash

kubectl delete -f storageclass.yaml -f toolbox.yaml -f cluster.yaml -f operator.yaml -f common.yaml -f crds.yaml

NAMESPACE=rook-ceph
kubectl proxy & kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >temp.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json localhost:8001/api/v1/namespaces/$NAMESPACE/finalize

rm -rf /var/lib/rook/*
rm -rf /var/lib/kubelet/plugins/rook-ceph.*
rm -rf /var/lib/kubelet/plugins_registry/rook-ceph.*
rm -rf /var/lib/rook
sync; echo 3 > /proc/sys/vm/drop_caches
sgdisk --zap-all /dev/sda1 && sgdisk --zap-all /dev/sdb1 && sgdisk --zap-all /dev/sdc1 && sgdisk --zap-all /dev/sdd1

ssh root@10.67.126.56 "rm -rf /var/lib/rook/*"
ssh root@10.67.126.56 "rm -rf /var/lib/kubelet/plugins/rook-ceph.*"
ssh root@10.67.126.56 "rm -rf /var/lib/kubelet/plugins_registry/rook-ceph.*"
ssh root@10.67.126.56 "rm -rf /var/lib/rook"
ssh root@10.67.126.56 "sync; echo 3 > /proc/sys/vm/drop_caches"
ssh root@10.67.126.56 "sgdisk --zap-all /dev/sde1 && sgdisk --zap-all /dev/sdb1 && sgdisk --zap-all /dev/sdc1 && sgdisk --zap-all /dev/sdd1"

ssh root@10.67.126.133 "rm -rf /var/lib/rook/*"
ssh root@10.67.126.133 "rm -rf /var/lib/kubelet/plugins/rook-ceph.*"
ssh root@10.67.126.133 "rm -rf /var/lib/kubelet/plugins_registry/rook-ceph.*"
ssh root@10.67.126.133 "rm -rf /var/lib/rook"
ssh root@10.67.126.133 "sync; echo 3 > /proc/sys/vm/drop_caches"
ssh root@10.67.126.133 "sgdisk --zap-all /dev/sde1 && sgdisk --zap-all /dev/sdb1 && sgdisk --zap-all /dev/sdc1 && sgdisk --zap-all /dev/sdd1"




