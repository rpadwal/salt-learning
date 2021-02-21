include:
  - apache.install
  - apache.mod.sap-proxy

/etc/apache2/sites-available/entrata.conf:
  file.managed:
    - source: salt://apache/vhost/files/entrata.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

{% if salt['grains.get']('environment') == 'lcl' %}
/etc/apache2/sites-enabled/zzzentrata.conf:
{% else %}
/etc/apache2/sites-enabled/entrata.conf:
{% endif %}
  file.symlink:
    - target: /etc/apache2/sites-available/entrata.conf
    - force: True
    - listen_in:
      - service: apache2

