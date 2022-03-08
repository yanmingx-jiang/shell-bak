scp /etc/kubernetes/admin.conf root@192.168.10.1:/etc/kubernetes/admin.conf
scp /etc/kubernetes/admin.conf root@192.168.10.2:/etc/kubernetes/admin.conf
scp /etc/kubernetes/admin.conf root@192.168.10.3:/etc/kubernetes/admin.conf
kubectl taint nodes see-prc-tingjie-ceph-3  node-role.kubernetes.io/master=:NoSchedule-
