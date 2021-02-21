include:
  - apache.install

/etc/apache2/sites-available/smartfulfillment.conf:
  file.managed:
    - source: salt://apache/vhost/files/smartfulfillment.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/smartfulfillment.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/smartfulfillment.conf
    - force: True
    - listen_in:
      - service: apache2

