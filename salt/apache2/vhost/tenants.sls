include:
  - apache.install

/etc/apache2/sites-available/tenants.conf:
  file.managed:
    - source: salt://apache/vhost/files/tenants.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/aaatenants.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/tenants.conf
    - force: True
    - listen_in:
      - service: apache2

