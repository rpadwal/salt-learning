{% from "php/version-map.jinja" import php_version with context %}

include:
  - apache.install
  - php

php-gnupg:
  pkg.installed:
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/mods-available/gnupg.ini:
  file.managed:
    - source: salt://php/module/files/extensions/gnupg.ini
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/apache2/conf.d/20-gnupg.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/gnupg.ini
    - makedirs: True
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/cli/conf.d/20-gnupg.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/gnupg.ini
    - makedirs: True
