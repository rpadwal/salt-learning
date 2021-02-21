include:
  - apache.install

/etc/apache2/sites-available/common.conf:
  file.managed:
    - source: salt://apache/vhost/files/common.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/common.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/common.conf
    - force: True
    - listen_in:
      - service: apache2

