{% from "php/package-map.jinja" import php_pkg with context %}

install-php-cli:
  pkg.installed:
    - name: {{ php_pkg }}-cli
