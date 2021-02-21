include:
  - apache.install

/etc/apache2/sites-available/entratafi.conf:
  file.managed:
    - source: salt://apache/vhost/files/entratafi.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/entratafi.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/entratafi.conf
    - force: True
    - listen_in:
      - service: apache2

