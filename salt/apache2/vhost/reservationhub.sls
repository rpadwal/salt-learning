include:
  - apache.install

/etc/apache2/sites-available/reservationhub.conf:
  file.managed:
    - source: salt://apache/vhost/files/reservationhub.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/reservationhub.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/reservationhub.conf
    - force: True
    - listen_in:
      - service: apache2

