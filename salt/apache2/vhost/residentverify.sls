include:
  - apache.install

/etc/apache2/sites-available/residentverify.conf:
  file.managed:
    - source: salt://apache/vhost/files/residentverify.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/residentverify.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/residentverify.conf
    - force: True
    - listen_in:
      - service: apache2

