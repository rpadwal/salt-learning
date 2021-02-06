mysql_server_config:
  file.managed:
    - name: /etc/mysql/my.cnf
    - source: salt://mysql/files/my.cnf
    - makedirs: True
