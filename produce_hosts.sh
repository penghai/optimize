#!/bin/bash

cidr=192.168.1.0/24
startip=192.168.1.21
endip=192.168.1.23
user=root
password=centos
subnet=`ipcalc -s -n $cidr|awk -F = '{print $2}'|awk -F 0 '{print $1}'`
start=`echo $startip|awk -F . '{print $NF}'`
end=`echo $endip|awk -F . '{print $NF}'`

for ip in $(seq $start $end) 
do
    echo "$subnet$ip ansible_ssh_host=$subnet$ip ansible_ssh_user=$user ansible_ssh_pass=$password"
done
