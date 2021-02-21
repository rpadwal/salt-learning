include:
  - apache.install

/etc/apache2/sites-available/elevate.conf:
  file.managed:
    - source: salt://apache/vhost/files/elevate.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/elevate.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/elevate.conf
    - force: True
    - listen_in:
      - service: apache2

