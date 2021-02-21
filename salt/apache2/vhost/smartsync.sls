include:
  - apache.install

/etc/apache2/sites-available/smartsync.conf:
  file.managed:
    - source: salt://apache/vhost/files/smartsync.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/smartsync.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/smartsync.conf
    - force: True
    - listen_in:
      - service: apache2

