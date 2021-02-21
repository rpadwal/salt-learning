{% from "php/version-map.jinja" import php_version with context %}
{% from "php/package-map.jinja" import php_pkg with context %}

include:
  - php
  - apache.install

{% if grains.osrelease|float < 18.04 %}
php-mcrypt:
  pkg.installed

{% else %}
php-mcrypt-prereqs:
  pkg.installed:
    - pkgs:
      - {{ php_pkg }}-common
      - {{ php_pkg }}-xml
      - {{ php_pkg }}-dev
      - libmcrypt-dev
      - php-pear

php-mcrypt-channel-update:
  cmd.wait:
    - name: 'pecl channel-update pecl.php.net'
    - watch:
      - pkg: php-mcrypt-prereqs

php-mcrypt-install:
  pecl.installed:
    - name: mcrypt
    - unless: 'php -m | grep mcrypt'
    - require:
      - cmd: php-mcrypt-channel-update

php-mcrypt-php-mods-available:
  file.managed:
    - name: /etc/php/{{ php_version }}/mods-available/mcrypt.ini
    - contents: 'extension=mcrypt.so'

php-mcrypt-php-cli-enable:
  file.symlink:
    - name: /etc/php/{{ php_version }}/cli/conf.d/20-mcrypt.ini
    - target: /etc/php/{{ php_version }}/mods-available/mcrypt.ini
    - makedirs: True
    - require:
      - pkg: php-install
      - pecl: php-mcrypt-install
      - file: php-mcrypt-php-mods-available

php-mcrypt-php-apache-enable:
  file.symlink:
    - name: /etc/php/{{ php_version }}/apache2/conf.d/20-mcrypt.ini
    - target: /etc/php/{{ php_version }}/mods-available/mcrypt.ini
    - makedirs: True
    - require:
      - pkg: php-install
      - pecl: php-mcrypt-install
      - file: php-mcrypt-php-mods-available
    - watch_in:
      - service: apache2

{% endif %}
