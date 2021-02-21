include:
  - apache.mod.ssl

/etc/apache2/ssl/gd_bundle_g2_g1.crt:
  file.managed:
    - source: salt://apache/cert/files/gd_bundle_g2_g1.crt
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - listen_in:
      - service: apache2
