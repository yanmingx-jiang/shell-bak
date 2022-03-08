casadm -P -i 1|grep Dirty|sed 1d && casadm -P -i 2|grep Dirty|sed 1d && casadm -P -i 3|grep Dirty|sed 1d && casadm -P -i 4|grep Dirty|sed 1d && casadm -P -i 5|grep Dirty|sed 1d
echo "=================="
ssh root@192.168.10.2 "casadm -P -i 1|grep Dirty|sed 1d && casadm -P -i 2|grep Dirty|sed 1d && casadm -P -i 3|grep Dirty|sed 1d && casadm -P -i 4|grep Dirty|sed 1d && casadm -P -i 5|grep Dirty|sed 1d"
echo "================="
ssh root@192.168.10.3 "casadm -P -i 1|grep Dirty|sed 1d && casadm -P -i 2|grep Dirty|sed 1d && casadm -P -i 3|grep Dirty|sed 1d && casadm -P -i 4|grep Dirty|sed 1d && casadm -P -i 5|grep Dirty|sed 1d"

