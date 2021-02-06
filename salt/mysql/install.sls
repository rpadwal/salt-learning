mysql_server_install:
  pkg.installed:
    - name: mysql-server
    - require_in:
      - /etc/mysql/my.cnf
