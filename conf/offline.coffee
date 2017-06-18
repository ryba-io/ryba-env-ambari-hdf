
module.exports = 
  config:
    proxy: null
    yum:
      epel: false
      clean: true
      config: proxy: null
      source: "#{__dirname}/offline/centos.repo"
      epel:
        enabled: false
        url: null
        source: "#{__dirname}/offline/epel.repo"
    curl:
      check: false
      config: noproxy: ['localhost', '127.0.0.1', '.ryba']
    mysql: server:
      repo:
        source: "#{__dirname}/offline/mysql.repo"
    profile:
      'proxy.sh': "" # Created by Vagrant proxy plugin
    ntp:
      fudge: true
    network:
      ifcfg:
        eth0:
          PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
        eth1:
          PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
  services:
    'ryba/hdf':
      constraints: tags: 'environment': 'dev'
      config: ryba: hdf:
        source: "#{__dirname}/offline/hdf.repo"
    'ryba/ambari/hdfrepo':
      constraints: tags: 'environment': 'dev'
      config: ryba: ambari: hdfrepo:
        source: "#{__dirname}/offline/ambari.repo"
