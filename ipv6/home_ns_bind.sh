#!/usr/bin/env sh

NS=home_ns
IF=wlp0s20f3
PHY=phy0

sudo ip netns add ${NS} || true
sudo iw phy ${PHY} set netns "$(sudo ip netns exec home_ns sh -c 'sleep 1 >&- & echo "$!"')"
# sudo ip link set ${IF} netns ${NS}
sudo ip netns exec ${NS} ip link set ${IF} up
sudo ip netns exec ${NS} ip link set dev lo up
sudo ip netns exec ${NS} dhclient ${IF}

ip netns exec ${NS} ping -4 9.9.9.9
ip netns exec ${NS} ping -4 google.com
ip netns exec ${NS} curl -4 icanhazip.com
