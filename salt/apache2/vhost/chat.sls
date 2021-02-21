include:
  - apache.install

/etc/apache2/sites-available/chat.conf:
  file.managed:
    - source: salt://apache/vhost/files/chat.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/chat.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/chat.conf
    - force: True
    - listen_in:
      - service: apache2

