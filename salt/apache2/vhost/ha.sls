include:
  - apache.install

/etc/apache2/sites-available/ha.conf:
  file.managed:
    - source: salt://apache/vhost/files/ha.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/ha.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/ha.conf
    - force: True
    - listen_in:
      - service: apache2

