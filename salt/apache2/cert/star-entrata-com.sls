include:
  - apache.mod.ssl
  - .network-solutions

/etc/apache2/ssl/star.entrata.com.key:
  file.managed:
    - contents: {{ salt.pillar.get('certs:star.entrata.com:key:value') | yaml_encode }}
    - show_changes: False
    - user: root
    - group: root
    - mode: 0600
    - makedirs: True
    - listen_in:
      - service: apache2

/etc/apache2/ssl/star.entrata.com.crt:
  file.managed:
    - contents: {{ salt.pillar.get('certs:star.entrata.com:cert:value') | yaml_encode }}
    - show_changes: False
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - listen_in:
      - service: apache2
