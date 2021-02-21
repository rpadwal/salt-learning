include:
  - apache
  - apache.install
  - apache.mod.ssl
  - apache.mod.rewrite
  - apache.cert.star-entrata-com

/etc/apache2/sites-available/wordpress.conf:
  file.managed:
    - source: salt://apache/vhost/files/wordpress.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/wordpress.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/wordpress.conf
    - force: True
    - listen_in:
      - service: apache2
