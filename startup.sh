#!/bin/ash

rm /opt/standalone-hdfs-1.0.0/namenode/logs/* /opt/standalone-hdfs-1.0.0/datanode/logs/*

/opt/standalone-hdfs-1.0.0/namenode/bin/start-namenode.sh

sleep 90

/opt/standalone-hdfs-1.0.0/namenode/bin/start-namenode.sh

sleep 60

tail -f /opt/standalone-hdfs-1.0.0/namenode/logs/*.log
