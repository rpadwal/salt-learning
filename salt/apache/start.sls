{%   from "apache/apache-map.jinja" import pkg_name with context %}

start_apache:
  service.running:
    - name: {{ pkg_name }}
    - require:
      - file: add_welcomepage
