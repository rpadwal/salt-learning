include:
  - apache
  - apache.install
  - apache.mod.ssl
  - apache.mod.rewrite
  - apache.mod.svn
  - apache.cert.star-propertysolutions-com
  - apache.htpasswd.svn-sec

/etc/apache2/sites-available/svn-sec.conf:
  file.managed:
    - source: salt://apache/vhost/files/svn-sec.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/svn-sec.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/svn-sec.conf
    - force: True
    - listen_in:
      - service: apache2
