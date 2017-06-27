
module.exports = 
  # config:
  #   proxy: null
  #   curl:
  #     check: false
  #     config: noproxy: ['localhost', '127.0.0.1', '.ryba']
  #   profile:
  #     'proxy.sh': "" # Created by Vagrant proxy plugin
  services:
    'masson/core/yum':
      config: yum:
        clean: true
        config: proxy: null
        source: "#{__dirname}/offline/centos.repo"
        epel:
          enabled: false
          url: null
          source: "#{__dirname}/offline/epel.repo"
    'masson/core/network':
      config: network:
        ifcfg:
          eth0:
            PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
          eth1:
            PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
    'masson/core/ntp':
      config: ntp:
        fudge: true
    'masson/commons/mysql/server':
      config: mysql: server:
        repo:
          source: "#{__dirname}/offline/mysql.repo"
    'ryba/hdf':
      config: ryba: hdf:
        source: "#{__dirname}/offline/hdf-2.1.2.0.repo"
    'ryba/ambari/hdfrepo':
      config: ryba: ambari: hdfrepo:
        source: "#{__dirname}/offline/ambari-2.4.2.0.repo"
