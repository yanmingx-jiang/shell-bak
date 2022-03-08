#!/bin/bash
ceph_mgr=$(find /var/lib/ -name *.asok|grep merged|grep ceph-mgr)
ceph_mon=$(find /var/lib/ -name *.asok|grep merged|grep ceph-mon)
ceph_osd=$(find /var/lib/ -name *.asok|grep merged|grep ceph-osd)

rm -rf /var/run/ceph/*

ln -s $ceph_mgr /var/run/ceph/ceph-mgr.a.asok
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "success"
fi
ln -s $ceph_mon /var/run/ceph/ceph-mon.a.asok
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "success"
fi
ln -s $ceph_osd /var/run/ceph/ceph-osd.0.asok
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "success"
fi