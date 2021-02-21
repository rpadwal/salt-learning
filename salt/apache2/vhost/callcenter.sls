include:
  - apache.install

/etc/apache2/sites-available/callcenter.conf:
  file.managed:
    - source: salt://apache/vhost/files/callcenter.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/callcenter.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/callcenter.conf
    - force: True
    - listen_in:
      - service: apache2

