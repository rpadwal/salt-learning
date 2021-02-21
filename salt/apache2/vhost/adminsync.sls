include:
  - apache.install

/etc/apache2/sites-available/adminsync.conf:
  file.managed:
    - source: salt://apache/vhost/files/adminsync.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/adminsync.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/adminsync.conf
    - force: True
    - listen_in:
      - service: apache2

