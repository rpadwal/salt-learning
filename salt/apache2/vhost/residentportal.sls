include:
  - apache.install

/etc/apache2/sites-available/residentportal.conf:
  file.managed:
    - source: salt://apache/vhost/files/residentportal.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/residentportal.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/residentportal.conf
    - force: True
    - listen_in:
      - service: apache2

/etc/apache2/sites-available/googleaction.residentportal.conf:
  file.managed:
    - source: salt://apache/vhost/files/googleaction.residentportal.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/googleaction.residentportal.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/googleaction.residentportal.conf
    - force: True
    - listen_in:
      - service: apache2


