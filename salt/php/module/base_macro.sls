{% macro install_php_module(module_name) %}
{% from "php/package-map.jinja" import php_pkg with context %}
php-{{ module_name }}-install:
  pkg.installed:
    - name: {{ php_pkg }}-{{ module_name }}
    - require:
      - pkg: php-install
{% endmacro %}