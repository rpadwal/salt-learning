include:
  - apache.install

/etc/apache2/sites-available/wwwentrata.conf:
  file.managed:
    - source: salt://apache/vhost/files/wwwentrata.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/wwwentrata.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/wwwentrata.conf
    - force: True
    - listen_in:
      - service: apache2

