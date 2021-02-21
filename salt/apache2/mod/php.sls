{% from "apache2/mod/php-map.jinja" import libapache2_mod_php_pkg with context %}

include:
  - apache.install

libapache2-mod-php:
  pkg.installed:
    - name: {{ libapache2_mod_php_pkg }}
