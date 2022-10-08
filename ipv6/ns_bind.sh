#!/usr/bin/env sh
# this pretty much just creates a new network namespace for the interface we get
# when we enable USB tethering on the phone. This enables us to use the phone interface
# for certain applications only.
# reference:
# - https://unix.stackexchange.com/questions/210982/bind-unix-program-to-specific-network-interface
# - https://superuser.com/questions/241178/how-to-use-different-network-interfaces-for-different-processes
# - https://gist.github.com/mtds/4c4925c2aa022130e4b7c538fdd5a89f
# - https://unix.stackexchange.com/questions/494324/how-to-setup-dns-manually-on-linux
# example: sudo ip netns exec phone_ns bash

PHONE_NS=phone_ns
IF=enp0s20f0u3u3

sudo ip netns add ${PHONE_NS}
sudo ip link set ${IF} netns ${PHONE_NS}
sudo ip netns exec ${PHONE_NS} ip link set ${IF} up
sudo ip netns exec ${PHONE_NS} ip link set dev lo up
# will need to install dhclient before runnning this dummy
# FIXME running dhclient fucks up resolv.conf
# FIXME right now we have to use sudo
sudo ip netns exec ${PHONE_NS} dhclient ${IF}

# ip netns add myNamespace
# ip link set eth0 netns myNamespace
# ip netns exec myNamespace ifconfig eth0 192.168.0.10/24 up
# ip netns exec myNamespace ifconfig lo 127.0.0.1/8 up
# ip netns exec myNamespace route add default gw 192.168.0.1
# ip netns exec myNamespace firefox

# ip netns add ${PHONE_NS}
# ip link set ${IF} netns ${PHONE_NS}
# ip netns exec ${PHONE_NS} ifconfig ${IF} 192.168.0.10/24 up
# ip netns exec ${PHONE_NS} ifconfig lo 127.0.0.1/8 up
# ip netns exec ${PHONE_NS} route add default gw 192.168.0.1
# ip netns exec ${PHONE_NS} dhclient ${IF}

# IF_A=v_eth0a
# IF_B=v_eth0b
# ip netns add ${PHONE_NS}
# ip link add ${IF_A} veth peer name ${IF_B}
# ip link set ${IF_A} netns ${PHONE_NS}
# ip netns exec ${PHONE_NS} ifconfig ${IF_A} up {{NAMESPACE_IP}} netmask {{NAMESPACE_NETMASK}}
# ifconfig ${IF_B} up {{ROOT_NS_IP}} netmask {{ROOT_NS_NETMASK}}
# ip netns exec ${PHONE_NS} route add default gw {{ROOT_NS_IP}} dev ${IF_A}
# sysctl net.ipv4.ip_forward=1
# iptables -t nat -A POSTROUTING -s {{ROUTE_SOURCE}}/24 -o {{NETWORK_INTERFACE}} -j SNAT --to-source {{ROUTE_TARGET}}
################################################################################
#test
ip netns exec ${PHONE_NS} ping -4 9.9.9.9
ip netns exec ${PHONE_NS} ping -4 google.com
ip netns exec ${PHONE_NS} curl -4 icanhazip.com
