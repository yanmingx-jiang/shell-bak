#iptables -t nat -F
#iptables -F
iptables -P FORWARD ACCEPT
iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
