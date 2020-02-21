#!/bin/bash
user=userName  #用户名
time1=$(date "+%Y-%m-%d %H:%M:%S")  
app1=`docker exec userName cat /sys/class/net/eth0/statistics/rx_bytes` #设定查看流量的容器，命令中的userName跟随user修改
ttl=201  #设定最大流量
echo $app1
if [ $app1 -ge $ttl ]; then
    docker stop $user
    echo "$time1 $user 大于设定流量本次检测结束......." >> ./demo.log
else
    echo "$time1 $user 小于设定流量本次检测结束......." >> ./demo.log
fi
