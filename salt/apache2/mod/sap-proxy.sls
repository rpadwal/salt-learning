include:
  - apache.install
{% if salt['grains.get']('environment') != 'lcl' %}
  - apache.mod.ssl
{% endif %}

proxy:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2

proxy_http:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2

/etc/apache2/mods-available/sap-proxy.conf:
  file.managed:
    - source: salt://apache/files/mods-available/sap-proxy.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/mods-enabled/sap-proxy.conf:
  file.symlink:
    - target: /etc/apache2/mods-available/sap-proxy.conf
    - force: True
    - listen_in:
      - service: apache2
