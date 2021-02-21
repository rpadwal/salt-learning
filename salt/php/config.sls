{% from "php/version-map.jinja" import php_version with context %}

include:
  - apache.install
  - .install

/etc/php/{{ php_version }}/apache2/php.ini:
  file.managed:
    - source: salt://php/files/php-apache{{ php_version }}.ini
    - template: jinja
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
    - watch_in:
      - service: apache2
