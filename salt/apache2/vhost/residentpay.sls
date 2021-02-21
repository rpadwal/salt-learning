include:
  - apache.install

/etc/apache2/sites-available/residentpay.conf:
  file.managed:
    - source: salt://apache/vhost/files/residentpay.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/residentpay.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/residentpay.conf
    - force: True
    - listen_in:
      - service: apache2

