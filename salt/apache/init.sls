{%- if salt.grains.get('os_family') == 'Debian' %}
{%- set apache_pkg = 'apache2' %}
{%- elif salt.grains.get('os_family') == 'RedHat' %}
{%- set apache_pkg = 'httpd' %}
{%- endif %}

install_apache:
  pkg.installed:
    - pkgs:
      - {{ apache_pkg }}
      - qpdf

start_apache:
  service.running:
    - name: {{ apache_pkg }}

include:
  - .welcome
