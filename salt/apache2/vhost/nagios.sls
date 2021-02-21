include:
  - apache
  - apache.install
  - apache.mod.ssl
  - apache.mod.rewrite
  - apache.mod.authnz_ldap
  - apache.cert.star-propertysolutions-com
  - apache.htpasswd.nagios
exclude:
  - apache.vhost.default

/etc/apache2/sites-available/nagios.conf:
  file.managed:
    - source: salt://apache/vhost/files/nagios.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/nagios.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/nagios.conf
    - force: True
    - listen_in:
      - service: apache2
