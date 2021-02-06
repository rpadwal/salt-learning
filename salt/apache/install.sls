{%   from "apache/apache-map.jinja" import pkg_name with context %}

install_apache:
  pkg.installed:
    - pkgs:
      - {{ pkg_name }}
