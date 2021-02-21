include:
  - apache.install

/etc/apache2/sites-available/agentaccessglobal.conf:
  file.managed:
    - source: salt://apache/vhost/files/agentaccessglobal.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/agentaccessglobal.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/agentaccessglobal.conf
    - force: True
    - listen_in:
      - service: apache2

