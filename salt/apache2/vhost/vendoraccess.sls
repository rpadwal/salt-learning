include:
  - apache.install

/etc/apache2/sites-available/vendoraccess.conf:
  file.managed:
    - source: salt://apache/vhost/files/vendoraccess.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/vendoraccess.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/vendoraccess.conf
    - force: True
    - listen_in:
      - service: apache2

