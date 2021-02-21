include:
  - apache.install

/etc/apache2/sites-available/sms.conf:
  file.managed:
    - source: salt://apache/vhost/files/sms.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/sms.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/sms.conf
    - force: True
    - listen_in:
      - service: apache2

