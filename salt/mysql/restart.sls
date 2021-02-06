mysql_restart:
  module.wait:
    - name: service.mysql_restart
    - m_name: mysql-server
    - watch:
      - mysql_server_config
