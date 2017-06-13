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
  https://hdfadmin01.ambari.ryba:8442
* Nifi
  https://collect01.ambari.ryba:9091/nifi

## Prepare your host

Register DNS

```bash
sudo tee -a /etc/hosts << HOSTS
# Ryba Env Ambari
10.10.10.20   hdfadmin01.ambari.ryba
10.10.10.21   hdfadmin02.ambari.ryba
10.10.10.27   collect01.ambari.ryba
10.10.10.28   collect02.ambari.ryba
10.10.10.29   collect03.ambari.ryba
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

Install the Kerberos client configuration

```bash
cp -rp /etc/krb5.conf /etc/krb5.conf.bck
sudo tee /etc/krb5.conf << KRB5
[libdefaults]
 default_realm = HADOOP.RYBA
[realms]
 HDF.HADOOP.RYBA = {
  kdc = collect01.ambari.ryba
  admin_server = collect01.ambari.ryba
  default_domain = ambari.ryba
 }
KRB5
```

## Ambari Installation

Select Version

* Check "Use Local Repository"
* Check "Use RedHat Satellite/Spacewalk"

Install Options

* Target Hosts
  hdfadmin[01-01].ambari.ryba
  collect[01-03].ambari.ryba
* Check "Perform manual registration on hosts and do not use SSH"

Assign Masters

* admin01.ambari.ryba (3.7 GB, 1 cores)
  Infra Solr Instance, Grafana, Metrics Collector, Log Search Server
* edge01.ambari.ryba (2.3 GB, 1 cores)
  TODO
* master01.ambari.ryba (3.7 GB, 1 cores)
  ZooKeeper Server, Kafka Broker, NiFi
* master02.ambari.ryba (3.7 GB, 1 cores)
  ZooKeeper Server, Kafka Broker, NiFi
* master03.ambari.ryba (2.3 GB, 1 cores)
  ZooKeeper Server, Kafka Broker, NiFi

Assign Slaves and Clients

* edges: client, Livy Server, Spark Thrift Server
* workers: HDFS DataNode, Yarn NodeManager, HBase RegionServer, Storm Supervisor, Flume

Customize Services

* ZooKeeper > ZooKeeper directory: /data/zookeeper
* Ambari Infra > Settings > Infra Solr data dir: "/data/solr"
* Ambari Metrics > Grafana Admin Password: "Graphana123-"
* Kafka > Kafka Broker > log.dirs: /data/kafka_1,/data/kafka_2
* Log Search > Advanced logsearch-admin-json > Admin Password: "LogSearch123-"
* Nifi > Nifi content repository default dir: "/data/nifi/content_repository"
* Nifi > Nifi H2 database dir: "/data/nifi/database_repository"
* Nifi > Nifi flowfile repository dir: "/data/nifi/flowfile_repository"
* Nifi > Nifi provenance repository default dir: "/data/nifi/provenance_repository"
* Nifi > Encrypt Configuration Master Key Password: "NifiMasterKey123-"
* Nifi > Sensitive property values encryption password: "NifiCrypt123"
