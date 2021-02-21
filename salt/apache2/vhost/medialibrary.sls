include:
  - apache.install
  - .common

/etc/apache2/sites-available/medialibrary.conf:
  file.managed:
    - source: salt://apache/vhost/files/medialibrary.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/medialibrary.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/medialibrary.conf
    - force: True
    - listen_in:
      - service: apache2

