include:
  - apache.install

/etc/apache2/sites-available/deploy.entrata.conf:
  file.managed:
    - source: salt://apache/vhost/files/deploy.entrata.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/deploy.entrata.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/deploy.entrata.conf
    - force: True
    - listen_in:
      - service: apache2

