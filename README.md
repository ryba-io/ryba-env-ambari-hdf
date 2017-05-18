# Getting started

Ryba is a Node.js tool to deploy and configure hadoop nodes through SSH.
This project contain a pre-configured environnement to get you started quickly
with a cluster of virtual machines. From there, you can update the configuration and adapt it
to your need based on your production environnement.

# Install Process

## VMs

You may use Vagrant to boostrap a cluster of virtual machines (VMs). Feel free to tweek
the default Vagrant definition located in "./resources/Vagrantfile" with your own
topology. The current definition set up a cluster of 6 VMs and require 16GB of memory.

## Quickstart Guide

To get started with Ryba, we recommend you to read the following resources:

* [Introduction](http://ryba.io/documentation/introduction)
* [Getting Started](http://ryba.io/documentation/getting_started)
* [Guide for Operators](http://ryba.io/documentation/operator)

```
git clone https://github.com/ryba-io/ryba-cluster
cd ryba-cluster
npm install
./bin/vagrant up
./bin/ryba install
```

Detailed information are available on the [official website](http://ryba.io).

## URLs

* Ambari Operational
  https://master01.ambari.ryba:8443
* Hadoop HDFS NN (krb UI)
  https://master1.ryba:50470 (active)
  https://master2.ryba:50470 (passive)
* Hadoop YARN RM (krb UI)
  https://master1.ryba:8090/cluster/apps
* Hadoop YARN TS (krb rest)
  https://master3.ryba:8190/ws/v1/timeline/

## Prepare your host

Register DNS

```bash
sudo tee -a /etc/hosts << HOSTS
# Ryba Env Ambari
10.10.10.20   admin01.ambari.ryba
10.10.10.21   admin02.ambari.ryba
10.10.10.22   master01.ambari.ryba
10.10.10.23   master02.ambari.ryba
10.10.10.24   master03.ambari.ryba
10.10.10.25   edge01.ambari.ryba
10.10.10.26   edge02.ambari.ryba
10.10.10.27   worker01.ambari.ryba
10.10.10.28   worker02.ambari.ryba
10.10.10.29   worker03.ambari.ryba
HOSTS
```

Set SSH aliases

```
tee -a ~/.profile << ALIASES
# Ryba Env Ambari
alias ambari_admin01='ssh root@admin01.ambari.ryba'
alias ambari_admin02='ssh root@admin02.ambari.ryba'
alias ambari_master01='ssh root@master01.ambari.ryba'
alias ambari_master02='ssh root@master02.ambari.ryba'
alias ambari_master03='ssh root@master03.ambari.ryba'
alias ambari_edge01='ssh root@edge01.ambari.ryba'
alias ambari_edge02='ssh root@edge02.ambari.ryba'
alias ambari_worker01='ssh root@worker01.ambari.ryba'
alias ambari_worker02='ssh root@worker02.ambari.ryba'
alias ambari_worker03='ssh root@worker03.ambari.ryba'
ALIASES
```

Install the Kerbeors client configuration

## Ambari Installation

Select Version

* Check "Use Local Repository"
* Check "Use RedHat Satellite/Spacewalk"

Install Options

* Target Hosts
  admin[01-01].ambari.ryba
  master[01-03].ambari.ryba
  edge[01-01].ambari.ryba
  worker[01-03].ambari.ryba
* Check "Perform manual registration on hosts and do not use SSH"

Assign Masters

* admin01.ambari.ryba (3.7 GB, 1 cores)
  Infra Solr Instance, Metrics Collector, Grafana, Atlas Metadata Server, Activity Explorer, HST Server, Activity Analyzer
* edge01.ambari.ryba (2.3 GB, 1 cores)
  WebHCat Server, HiveServer2, Storm UI Server, Knox Gateway, Spark History Server, Zeppelin Notebook
* master01.ambari.ryba (3.7 GB, 1 cores)
  NameNode, HBase Master, ZooKeeper Server, Kafka Broker
* master02.ambari.ryba (3.7 GB, 1 cores)
  SNameNode, Oozie Server, ZooKeeper Server, Falcon Server, Nimbus, DRPC Server, Kafka Broker
* master03.ambari.ryba (2.3 GB, 1 cores)
  App Timeline Server, History Server, ResourceManager, Hive Metastore, HBase Master, ZooKeeper Server, Kafka Broker

Assign Slaves and Clients

* edges: client, Livy Server, Spark Thrift Server
* workers: HDFS DataNode, Yarn NodeManager, HBase RegionServer, Storm Supervisor, Flume

Customize Services

* ZooKeeper > ZooKeeper directory: /data/zookeeper
* HDFS > NameNode directories: /data/hdfs/namenode
* HDFS > SecondaryNameNode Checkpoint directories: /data/hdfs/secondaynamenode
* HDFS > DataNode directories: /data/hadoop_1/hdfs/data,/data/2/hadoop_1/data
* YARN > Advanced > Node Manager > yarn.nodemanager.local-dirs: /data/hadoop_1/yarn/local,/data/hadoop_2/yarn/local
* YARN > Advanced > Node Manager > yarn.nodemanager.log-dirs: /data/hadoop_1/yarn/log,/data/hadoop_2/yarn/log
* Hive > Advanced > Check "Existing MySQL / MariaDB Database"
* Hive > Advanced > Database Password: Hive123-
* Hive > Advanced > Database URL: "jdbc:mysql://master01.ambari.ryba/oozie
* Oozie > Advanced > Check "Existing MySQL / MariaDB Database"
* Oozie > Advanced > Database Password: Oozie123-
* Oozie > Advanced > Database URL: "jdbc:mysql://master01.ambari.ryba/oozie"
* Ambari Infra > Settings > Infra Solr data dir: "/data/solr"
* Ambari Metrics > Grafana Admin Password: "graphana123"
* Kafka > Kafka Broker > log.dirs: /data/kafka_1,/data/kafka_2
* Knox > Knox Gateway > Knox Master Secret: "knox123"
* SmartSense > Activity Analysis >  Password for user 'admin': 'sense123'
