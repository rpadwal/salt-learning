include:
  - apache.install

/etc/apache2/sites-available/system.conf:
  file.managed:
    - source: salt://apache/vhost/files/system.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/system.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/system.conf
    - force: True
    - listen_in:
      - service: apache2

