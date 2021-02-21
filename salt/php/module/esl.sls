{% from "php/module/map.jinja" import lookup with context %}
{% from "php/version-map.jinja" import php_version with context %}

include:
  - apache.install
  - php

/usr/local/lib/php/extensions/esl.so:
  file.managed:
    - source: salt://php/module/files/extensions/{{ lookup['esl.so'] }}
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/mods-available/esl.ini:
  file.managed:
    - source: salt://php/module/files/extensions/esl.ini
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/apache2/conf.d/20-esl.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/esl.ini
    - makedirs: True
    - listen_in:
      - service: apache2

/etc/php/{{ php_version }}/cli/conf.d/20-esl.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/esl.ini
    - makedirs: True
