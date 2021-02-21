include:
  - apache.install

{%- set post = '-7.2' if grains.vhost == 'residentinsure' else '' %}

/etc/apache2/sites-available/residentinsure.conf:
  file.managed:
    - source: salt://apache/vhost/files/residentinsure{{ post }}.conf
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/residentinsure.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/residentinsure.conf
    - force: True
    - listen_in:
      - service: apache2

