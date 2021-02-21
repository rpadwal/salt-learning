include:
  - apache.install

/etc/apache2/sites-available/gateway.conf:
  file.managed:
    - source: salt://apache/vhost/files/gateway.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/gateway.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/gateway.conf
    - force: True
    - listen_in:
      - service: apache2

