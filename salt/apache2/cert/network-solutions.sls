include:
  - apache.mod.ssl

/etc/apache2/ssl/networksolutions_bundle.crt:
  file.managed:
    - contents: {{ salt.pillar.get('certs:NetworkSolutions_Bundle:cert:value') | yaml_encode }}
    - show_changes: False
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - listen_in:
      - service: apache2
