/etc/ssl/identrust/identrust.pem:
  file.managed:
    - template: jinja
    - mode: 640
    - user: www-data
    - group: www-data
    - makedirs: True
    - contents_pillar:
      - emh-keys:identrust:key:value
      - emh-cert:identrust:cert:value
      - emh-cert:rootchain:cert:value

/etc/ssl/identrust:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 755
