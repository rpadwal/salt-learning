include:
  - apache.install
  - git.install
  - php.module.stats

/etc/apache2/sites-available/clientadmin.conf:
  file.managed:
    - source: salt://apache/vhost/files/clientadmin.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/clientadmin.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/clientadmin.conf
    - force: True
    - listen_in:
      - service: apache2

find /tmp/ -depth ! -readable -o -type f -name "zshm_ZShmStorage*" -atime +1 -delete:
  cron.present:
    - identifier: Zend_Data_Cache_AGE_CACHE
    - user: www-data
    - minute: random

