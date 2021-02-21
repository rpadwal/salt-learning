include:
  - apache.install

/etc/apache2/sites-available/callcentertest.conf:
  file.managed:
    - source: salt://apache/vhost/files/callcentertest.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/callcentertest.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/callcentertest.conf
    - force: True
    - listen_in:
      - service: apache2
