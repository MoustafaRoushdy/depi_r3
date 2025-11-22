#!/bin/bash
set -xe
dnf update -y
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/99-nat.conf
sysctl -p /etc/sysctl.d/99-nat.conf
dnf install -y iptables-services
iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
iptables -F FORWARD
iptables-save > /etc/sysconfig/iptables
systemctl enable --now  iptables
