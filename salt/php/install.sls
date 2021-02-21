{% from "php/package-map.jinja" import php_pkg with context %}

{% if grains.os == 'Ubuntu' and grains.osrelease == '18.04' %}
php-repo:
  pkgrepo.managed:
    - name: deb http://entrata-aptly-repo.s3-website-us-east-1.amazonaws.com/php/{{ grains.oscodename }} {{ grains.oscodename }} main
    - file: /etc/apt/sources.list.d/ondrej-ubuntu-php-{{ grains.oscodename }}.list
{% endif %}

php-install:
  pkg.installed:
    - name: {{ php_pkg }}
{% if grains.os == 'Ubuntu' and grains.osrelease == '18.04' %}
    - require:
      - pkgrepo: php-repo

{%   from "php/version-map.jinja" import php_version with context %}
php-set-default:
  cmd.run:
    - name: update-alternatives --set php /usr/bin/php{{ php_version }}
    - unless:
      - 'php -v | grep "PHP {{ php_version }}"'
    - require:
      - pkg: php-install

php-disable-7.2:
  apache_module.disabled:
    - name: php7.2
    - require:
      - pkg: php-install

php-enable-{{ php_version }}:
  apache_module.enabled:
    - name: php{{ php_version }}
    - require:
      - pkg: php-install
{% endif %}