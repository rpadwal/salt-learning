{%   from "apache/apache-map.jinja" import pkg_name with context %}

start_apache:
  service.running:
    - name: {{ apache_pkg }}
    - require:
      - file: add_welcomepage
