include:
  - apache.install
{# Disabling this as we need to add file.absent lines.
/etc/apache2/sites-available/residentsync.conf:
  file.managed:
    - source: salt://apache/vhost/files/residentsync.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/residentsync.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/residentsync.conf
    - force: True
    - listen_in:
      - service: apache2
#}

/etc/apache2/sites-available/residentsync.conf:
  file.absent

/etc/apache2/sites-enabled/residentsync.conf:
  file.absent
