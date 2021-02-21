include:
  - apache.install
  - .common

/etc/apache2/sites-available/zzz_prospectportal.conf:
  file.managed:
    - source: salt://apache/vhost/files/prospectportal.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/zzz_prospectportal.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/zzz_prospectportal.conf
    - force: True
    - listen_in:
      - service: apache2

