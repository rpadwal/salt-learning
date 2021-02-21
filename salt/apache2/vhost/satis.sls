include:
  - apache.install

/etc/apache2/sites-available/satis.conf:
  file.managed:
    - source: salt://apache/vhost/files/satis.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja

/etc/apache2/sites-enabled/satis.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/satis.conf
    - force: True
