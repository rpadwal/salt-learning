include:
  - apache.mod.ssl
  - .godaddy

/etc/apache2/ssl/star.propertysolutions.com.key:
  file.managed:
    - source: salt://apache/cert/files/star.propertysolutions.com.key
    - user: root
    - group: root
    - mode: 0600
    - makedirs: True
    - listen_in:
      - service: apache2

/etc/apache2/ssl/star.propertysolutions.com.crt:
  file.managed:
    - source: salt://apache/cert/files/star.propertysolutions.com.crt
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - listen_in:
      - service: apache2
