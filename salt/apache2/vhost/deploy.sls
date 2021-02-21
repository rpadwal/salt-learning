include:
  - apache.install

/etc/apache2/sites-available/deploy.conf:
  file.managed:
    - source: salt://apache/vhost/files/deploy.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/deploy.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/deploy.conf
    - force: True
    - listen_in:
      - service: apache2
