include:
  - php
  - apache.install

{% if grains.os == 'Ubuntu' and grains.osrelease|float < 18.04 %}

php-redis-install:
  pkg.installed:
    - name: php-redis
    - require:
      - pkg: php-install

{% else %}

{% from "php/package-map.jinja" import php_pkg with context %}
{% from "php/version-map.jinja" import php_version with context %}

php-redis-prereqs:
  pkg.installed:
    - pkgs:
      - {{ php_pkg }}-dev
      - php-pear

php-redis-install:
  pecl.installed:
    - name: redis
    - unless: 'php -m | grep redis'
    - require:
      - pkg: php-redis-prereqs

php-redis-php-mods-available:
  file.managed:
    - name: /etc/php/{{ php_version }}/mods-available/redis.ini
    - contents: 'extension=redis.so'

php-redis-php-cli-enable:
  file.symlink:
    - name: /etc/php/{{ php_version }}/cli/conf.d/20-redis.ini
    - target: /etc/php/{{ php_version }}/mods-available/redis.ini
    - makedirs: True
    - require:
      - pkg: php-install
      - pecl: php-redis-install
      - file: php-redis-php-mods-available

php-redis-php-apache-enable:
  file.symlink:
    - name: /etc/php/{{ php_version }}/apache2/conf.d/20-redis.ini
    - target: /etc/php/{{ php_version }}/mods-available/redis.ini
    - makedirs: True
    - require:
      - pkg: php-install
      - pecl: php-redis-install
      - file: php-redis-php-mods-available
    - watch_in:
      - service: apache2

{% endif %}