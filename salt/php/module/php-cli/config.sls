{% from "php/version-map.jinja" import php_version with context %}

include:
  - php
  - .install

php-cli-ini:
  file.symlink:
    - name: /etc/php/{{ php_version }}/cli/php.ini
    - target: /etc/php/{{ php_version }}/apache2/php.ini
    - force: True
    - require:
      - file: /etc/php/{{ php_version }}/apache2/php.ini
