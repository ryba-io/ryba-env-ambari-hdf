
module.exports =
  config: 
    ssh:
      private_key: """
      -----BEGIN RSA PRIVATE KEY-----
      MIIEogIBAAKCAQEArBDFt50aN9jfIJ629pRGIMA1fCMb9RyTHt9A+jx3FOsIOtJs
      eaBIpv98drbFVURr+cUs/CrgGVk5k2NIeiz0bG4ONV5nTwx38z5CzqLb7UryZS3i
      a/TS14fWOxvWTRR27R71ePX90G/ZIReKFeTrucw9y9Pl+xAzsmeblRwLBxv/SWBX
      Uai2mHAZaejlG9dGkn9f2n+oPmbgk6krLMCjLhlNBnkdroBNSXGA9ewLPFF4y54Q
      kBqmG3eLzCqAKAzwyJ5PpybtNGAWfN81gY/P5LBzC66WdtEzpwsYAv1wCioqggtg
      xVZN2s0ajxQrCxahRkXstBI2IDcm2qUTxaDbUwIDAQABAoIBAFruOi7AvXxKBhCt
      D6/bx/vC2AEUZM/yG+Wywhn8HkpVsvGzBlR4Wiy208XA7SQUlqNWimFxHyEGQCEd
      1M2MOFedCbE2hI4H3tQTUSb2dhc/Bj5mM0QuC8aPKK3wFh6B9B93vu3/wfSHR03v
      rK/JXLHBt96hyuYVN9zOWDBCs6k7SdQ2BcsQLiPg6feTsZelJDuO+DO65kKLMiz3
      mNPThErklRaKovNk47LSYakk6gsJXrpG6JWQ6nwsRenwplDwZ8Zs9mlRi7f3nChM
      3I1WlISN8y2kcQBQ94YZKk8wzH/lzmxsabcLa5ETNubxQ6ThDu1oYUIIUsQyNPm+
      DkW0VwECgYEA5MttelspKexWS39Y3sQYvZ/v8VZBQl4tRbpUWWc+PNEtcEwOBza/
      H4jBWYd2eWKTApJT1st58E4b34Mv88nQVElLb3sE7uJMkihPyNpABGbCvr63hDYw
      PyL53nKaPelY/aDnL0F8LmREfdKw/uy6+UChgkPfdo2VVk1oyvsZaRMCgYEAwIZ+
      lCmeXQ4mU6uxO+ChhDn7zw9rR5qlCyfJiLPe2lV20vaHV5ZfKIWGegsVJSpFr2ST
      5ghh+FVIneoNRtTHEKwNWCK7I6qeF+WAaci+KsLQigJQHsw58n9cdA7wHHc475n/
      pf7efoPcvk6qYOS2mpDgC87m+o3C4Dyspqp9TMECgYA4/ed+dBjT5Zg1ZDp5+zUC
      f0Wgw1CsPJNgbCK4xnv9YEnGUFuqNlvzefhX2eOMJx7hpBuYRMVSM9LDoYUfYCUx
      6bQNyAIZk2tpePsu2BbcQdC+/PjvySPJhmfhnoCHbYoKW7tazSAm2jkpcoM+bS/C
      CPRyY3/Voz0Q62VwMo5I2wKBgB4mMbZUGieqapgZwASHdeO2DNftKzioYAYyMd5F
      hLWeQqBg2Or/cmFvH5MHH0WVrBn+Xybb0zPHbzrDh1a7RX035FMUBUhdlKpbV1O5
      iwY5Qd0K5a8c/koaZckK+dELXpAvBpjhI8ieL7hhq07HIk1sOJnAye0cvBLPjZ3/
      /uVBAoGAVAs6tFpS0pFlxmg4tfGEm7/aP6FhyBHNhv2QGluw8vv/XVMzUItxGIef
      HcSMWBm08IJMRJLgmoo1cuQv6hBui7JpDeZk/20qoF2oZW9lJ9fdRObJqi61wufP
      BNiriqexq/eTy2uF9RCCjLItWxUscVMlVt4V65HLkCF5WxCQw+o=
      -----END RSA PRIVATE KEY-----
      """
      public_key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsEMW3nRo32N8gnrb2lEYgwDV8Ixv1HJMe30D6PHcU6wg60mx5oEim/3x2tsVVRGv5xSz8KuAZWTmTY0h6LPRsbg41XmdPDHfzPkLOotvtSvJlLeJr9NLXh9Y7G9ZNFHbtHvV49f3Qb9khF4oV5Ou5zD3L0+X7EDOyZ5uVHAsHG/9JYFdRqLaYcBlp6OUb10aSf1/af6g+ZuCTqSsswKMuGU0GeR2ugE1JcYD17As8UXjLnhCQGqYbd4vMKoAoDPDInk+nJu00YBZ83zWBj8/ksHMLrpZ20TOnCxgC/XAKKiqCC2DFVk3azRqPFCsLFqFGRey0EjYgNybapRPFoNtT Ryba Hadoop'
      root:
        username: 'vagrant'
        private_key_path: "~/.vagrant.d/insecure_private_key"
    nikita:
      domain: true
      cache_dir: "#{__dirname}/../cache"
      log_serializer: true
      debug: false
      log_md:
        archive: false
        rotate: true
  services:
    'masson/core/system':
      constraints: tags: 'environment': 'dev'
      config: system:
        selinux: 'permissive'
        limits: {}
        users: {}
    'masson/core/yum':
      constraints: tags: 'environment': 'dev'
      config: yum:
        packages:
          'tree': true, 'git': true, 'htop': false, 'vim': true, 
          'bash-completion': true, 'unzip': true,
          'net-tools': true # Install netstat
    'masson/core/ssh':
      constraints: tags: 'environment': 'dev'
      config: ssh:
        banner:
          target: '/etc/banner'
          content: "Welcome to Hadoop!"
        sshd_config:
          PermitRootLogin: 'without-password'
    'masson/core/ntp':
      constraints: tags: 'environment': 'dev'
      config: ntp:
        servers: ['master_03.ambari.ryba']
    'masson/core/network':
      constraints: tags: 'environment': 'dev'
      config: network:
        hosts:
          '127.0.0.1': 'localhost localhost.localdomain localhost4 localhost4.localdomain4'
          '10.10.10.10': 'repos.ryba ryba'
        hosts_auto: true
        resolv: false
        # resolv: """
        #   search ryba
        #   #nameserver 10.10.10.24
        #   nameserver 10.0.2.3
        #   """
    'masson/core/iptables':
      constraints: tags: 'environment': 'dev'
      config: iptables:
        action: 'stop'
        startup: false
        log: true
        rules: [
          # { chain: 'INPUT', jump: 'ACCEPT', source: "10.10.10.0/24", comment: 'Local Network' }
        ]
    'masson/core/openldap_server':
      constraints: nodes: ['master_02', 'master_03']
      config:
        openldap_server:
          suffix: 'dc=ryba'
          root_dn: 'cn=ldapadm,dc=ryba'
          root_password: 'test'
          config_dn: 'cn=admin,cn=config'
          config_password: 'test'
          users_dn: 'ou=users,dc=ryba'
          groups_dn: 'ou=groups,dc=ryba'
          ldapdelete: []
          ldapadd: []
          tls: true
          tls_ca_cert_file: "#{__dirname}/certs/cacert.pem"
          tls_ca_cert_local: true
          tls_cert_local: true
          tls_key_local: true
        openldap_server_krb5:
          krbadmin_user:
            mail: 'david@adaltas.com'
            userPassword: 'test'
    'masson/core/openldap_client':
      constraints: nodes: ['master_03', 'master_02']
      config:  openldap_client:
        certificates: [
          source: "#{__dirname}/certs/cacert.pem", local: true
        ]
        config: {}
    'masson/core/krb5_server':
      constraints: nodes: ['master_01']
      config: krb5:
        # database_module: 'openldap_master3'
        etc_krb5_conf:
          libdefaults:
            default_realm: 'HADOOP.RYBA'
          realms:
            'HADOOP.RYBA': {}
            'USERS.RYBA': {}
          domain_realm:
            '.ryba': 'HADOOP.RYBA'
            'ryba': 'HADOOP.RYBA'
          realms:
            'HADOOP.RYBA':
              kadmin_principal: 'wdavidw/admin@HADOOP.RYBA'
              kadmin_password: 'test'
              principals: [
                principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
                password: 'test'
              ]
        kdc_conf:
          realms:
            'HADOOP.RYBA':
              database_module: 'masson_default'
          dbmodules:
            'masson_default':
              kdc_master_key: 'test'
    'masson/core/krb5_client': {}
    'masson/commons/java':
      constraints: tags: 'environment': 'dev'
    'masson/commons/mysql/client':
      constraints: tags: 'environment': 'dev'
    'masson/commons/mysql/server':
      constraints: nodes: ['master_01']
      config: mysql: server:
        current_password: ''
        password: 'MySQL123-'
        my_conf: {}
    # Ambari
    'ryba/ambari/server':
      constraints: nodes: ['master_01']
      config: ryba: ambari_server:
        repo: false
        cluster_name: 'cluster_01'
        admin_password: 'admin123'
        master_key: 'ambariMasterKey123'
        config:
          'api.ssl': 'false'
        db:
          engine: 'mysql'
          password: 'Ambari123-'
    'ryba/ambari/agent':
      constraints: tags: 'role': 'client'
  nodes:
    'admin_01':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.20'
        host: 'admin_01.ambari.ryba'
        ryba: ssl:
          'cert': "#{__dirname}/certs/admin_01_cert.pem"
          'key': "#{__dirname}/certs/admin_01_key.pem"
    'master_01':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.22'
        host: 'master_01.ambari.ryba'
        ryba: ssl:
          'cert': "#{__dirname}/certs/master_01_cert.pem"
          'key': "#{__dirname}/certs/master_01_key.pem"
    'master_02':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.23'
        host: 'master_02.ambari.ryba'
        openldap_server:
          tls_cert_file: "#{__dirname}/certs/master_02_cert.pem"
          tls_key_file: "#{__dirname}/certs/master_02_key.pem"
        ryba: ssl:
          'cert': "#{__dirname}/certs/master_02_cert.pem"
          'key': "#{__dirname}/certs/master_02_key.pem"
    'master_03':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.24'
        host: 'master_03.ambari.ryba'
        openldap_server:
          tls_cert_file: "#{__dirname}/certs/master_03_cert.pem"
          tls_key_file: "#{__dirname}/certs/master_03_key.pem"
        ryba: ssl:
          'cert': "#{__dirname}/certs/master_03_cert.pem"
          'key': "#{__dirname}/certs/master_03_key.pem"
    'edge_01':
      tags:
        'environment': 'dev'
        'role': 'client'
      config:
        ip: '10.10.10.25'
        host: 'edge_01.ambari.ryba'
        ryba: ssl:
          'cert': "#{__dirname}/certs/edge_01_cert.pem"
          'key': "#{__dirname}/certs/edge_01_key.pem"
    'worker_01':
      tags:
        'environment': 'dev'
        'role': 'worker'
      config:
        ip: '10.10.10.27'
        host: 'worker_01.ambari.ryba'
        ryba: ssl:
          'cert': "#{__dirname}/certs/worker_01_cert.pem"
          'key': "#{__dirname}/certs/worker_01_key.pem"
    'worker_02':
      tags:
        'environment': 'dev'
        'role': 'worker'
      config:
        ip: '10.10.10.28'
        host: 'worker_02.ambari.ryba'
        ryba: ssl:
          'cert': "#{__dirname}/certs/worker_02_cert.pem"
          'key': "#{__dirname}/certs/worker_02_key.pem"
    'worker_03':
      tags:
        'environment': 'dev'
        'role': 'worker'
      config:
        ip: '10.10.10.29'
        host: 'worker_03.ambari.ryba'
        ryba: ssl:
          'cert': "#{__dirname}/certs/worker_03_cert.pem"
          'key': "#{__dirname}/certs/worker_03_key.pem"
