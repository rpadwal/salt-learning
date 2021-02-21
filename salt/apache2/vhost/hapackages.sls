include:
  - apache.install

/etc/apache2/sites-available/hapackages.conf:
  file.managed:
    - source: salt://apache/vhost/files/hapackages.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/hapackages.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/hapackages.conf
    - force: True
    - listen_in:
      - service: apache2

