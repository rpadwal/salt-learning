include:
  - apache.install

/etc/apache2/sites-available/mediawiki.conf:
  file.managed:
    - source: salt://apache/vhost/files/mediawiki.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/mediawiki.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/mediawiki.conf
    - force: True
    - listen_in:
      - service: apache2
