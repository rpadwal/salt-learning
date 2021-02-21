include:
  - apache.install

/etc/apache2/sites-available/entrataleasing.conf:
  file.managed:
    - source: salt://apache/vhost/files/entrataleasing.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/entrataleasing.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/entrataleasing.conf
    - force: True
    - listen_in:
      - service: apache2

