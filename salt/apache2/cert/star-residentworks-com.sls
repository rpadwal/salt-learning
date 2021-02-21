include:
  - apache.mod.ssl
  - .godaddy

/etc/apache2/ssl/star.residentworks.com.key:
  file.managed:
    - source: salt://apache/cert/files/star.residentworks.com.key
    - user: root
    - group: root
    - mode: 0600
    - listen_in:
      - service: apache2

/etc/apache2/ssl/star.residentworks.com.crt:
  file.managed:
    - source: salt://apache/cert/files/star.residentworks.com.crt
    - user: root
    - group: root
    - mode: 0644
    - listen_in:
      - service: apache2
