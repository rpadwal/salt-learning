include:
  - apache.install
  - apache.mod.rewrite
  - apache.mod.ssl
  - apache.cert.star-entrata-com

/etc/apache2/sites-available/opswiki.conf:
  file.managed:
    - source: salt://apache/vhost/files/opswiki.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/opswiki.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/opswiki.conf
    - force: True
    - listen_in:
      - service: apache2

eneable-default-ssl:
  cmd.run:
    - name: 'a2ensite default-ssl'
    - unless: 'test -e /etc/apache2/sites-enabled/default-ssl.conf'
    - watch_in:
      - service: apache2
