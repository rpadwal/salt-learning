include:
  - apache.install

/etc/apache2/sites-available/zendserver_gui.conf:
  file.managed:
    - source: salt://apache/vhost/files/zendserver_gui.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/zendserver_gui.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/zendserver_gui.conf
    - force: True
    - listen_in:
      - service: apache2
