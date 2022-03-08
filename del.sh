#!/bin/bash
MGR=$(kubectl get po -n rook-ceph |grep rook-ceph-mgr |awk '{print $1}')
kubectl delete -n rook-ceph po/$MGR --force
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "success"
fi

MON=$(kubectl get po -n rook-ceph |grep rook-ceph-mon |awk '{print $1}')
kubectl delete -n rook-ceph po/$MON --force
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "success"
fi

OSD=$(kubectl get po -n rook-ceph |grep rook-ceph-osd |awk '{print $1}')
for I in $OSD;do
    kubectl delete -n rook-ceph po/$I --force
done

if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "success"
fi