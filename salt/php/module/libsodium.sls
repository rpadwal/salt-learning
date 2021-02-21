{% from "php/version-map.jinja" import php_version with context %}

include:
  - apache.install
  - php

{% if grains['osrelease']|float < 18.04 %} # libsodium is included with php >= 7.2
/usr/local/lib/php/extensions/sodium.so:
  file.managed:
    - source: salt://php/module/files/extensions/sodium.so
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/mods-available/libsodium.ini:
  file.managed:
    - source: salt://php/module/files/extensions/libsodium.ini
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/apache2/conf.d/20-libsodium.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/libsodium.ini
    - makedirs: True
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/cli/conf.d/20-libsodium.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/libsodium.ini
    - makedirs: True
{% endif %}
