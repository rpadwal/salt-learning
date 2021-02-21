include:
  - apache.install
  - apache.mod.ssl
  - apache.cert.star-entrata-com
exclude:
  - apache.vhost.default

/etc/apache2/sites-available/000-default.conf:
  file.managed:
    - source: salt://apache/vhost/files/aptly.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/000-default.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/000-default.conf
    - force: True
    - listen_in:
      - service: apache2
