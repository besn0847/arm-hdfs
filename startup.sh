#!/bin/ash

rm /opt/standalone-hdfs-1.0.0/namenode/logs/* /opt/standalone-hdfs-1.0.0/datanode/logs/*

/opt/standalone-hdfs-1.0.0/namenode/bin/start-namenode.sh

sleep 60

/opt/standalone-hdfs-1.0.0/datanode/bin/start-datanode.sh

sleep 30

tail -f /opt/standalone-hdfs-1.0.0/namenode/logs/*.log
