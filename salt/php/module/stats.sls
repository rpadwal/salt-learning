{% from "php/version-map.jinja" import php_version with context %}
{% from "php/package-map.jinja" import php_pkg with context %}

include:
  - apache.install
  - php

stats-prerequisites:
  pkg.installed:
    - pkgs:
      - php-pear
      - {{ php_pkg }}-dev

## Unregister the existing install and reinstall based on PHP version set in map
install-stats:
  cmd.run:
    - name: pecl uninstall -r stats && pecl -d php_suffix={{ php_version }} install stats-2.0.3
    - unless:
      - php -m | grep stats

stats-ini:
  file.managed:
    - name: /etc/php/{{ php_version }}/mods-available/stats.ini
    - contents: 'extension=stats.so'
    - makedirs: True
    - require:
      - cmd: install-stats

/etc/php/{{ php_version }}/apache2/conf.d/20-stats.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/stats.ini
    - makedirs: True
    - listen_in:
      - service: apache2
    - require:
      - file: stats-ini

/etc/php/{{ php_version }}/cli/conf.d/20-stats.ini:
  file.symlink:
    - target: /etc/php/{{ php_version }}/mods-available/stats.ini
    - makedirs: True
    - require:
      - file: stats-ini
