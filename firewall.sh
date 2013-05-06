#!/bin/bash


iptables -F
iptables -A INPUT -i lo -j ACCEPT

iptables -A INPUT -s 192.168.2.0/24 -i eth1 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth0 -j MASQUERADE

#router 2
iptables -A INPUT -s 192.168.3.0/24 -i eth2 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -o eth0 -j MASQUERADE

echo 1 >/proc/sys/net/ipv4/ip_forward
echo "biennn!!!"
