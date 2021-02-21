include:
  - apache.install

/etc/apache2/sites-available/jobs.conf:
  file.managed:
    - source: salt://apache/vhost/files/jobs.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/jobs.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/jobs.conf
    - force: True
    - listen_in:
      - service: apache2

