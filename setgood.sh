#!/bin/bash
ceph daemon mon.a config set leveldb_cache_size 134217728
ceph daemon mon.a config set rocksdb_cache_size 134217728
ceph daemon mon.a config set mon_memory_target 268435456
ceph daemon mon.a config set leveldb_cache_size 134217728
ceph daemon mon.a config set rocksdb_cache_size 134217728
ceph daemon mon.a config set osd_memory_target 1073741824
ceph daemon mon.a config set rbd_mirror_memory_target 268435456
ceph daemon mon.a config set bluestore_cache_size_ssd 268435456
ceph daemon mon.a config set bluestore_cache_size_hdd 134217728
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "mon_success"
fi
ceph daemon osd.0 config set leveldb_cache_size 134217728
ceph daemon osd.0 config set rocksdb_cache_size 134217728
ceph daemon osd.0 config set mon_memory_target 268435456
ceph daemon osd.0 config set leveldb_cache_size 134217728
ceph daemon osd.0 config set rocksdb_cache_size 134217728
ceph daemon osd.0 config set osd_memory_target 1073741824
ceph daemon osd.0 config set rbd_mirror_memory_target 268435456
ceph daemon osd.0 config set bluestore_cache_size_ssd 268435456
ceph daemon osd.0 config set bluestore_cache_size_hdd 134217728
if [ $? -ne 0 ] ; then
    echo "faild"
else
    echo "osd_success"
fi