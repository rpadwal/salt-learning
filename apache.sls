{%- if salt.grains.get('os_family') == 'Debian' %}
{%- set apache_pkg = 'apache2' %}
{%- elif salt.grains.get('os_family') == 'RedHat' %}
{%- set apache_pkg = 'httpd' %}
{%- endif %}

install_apache:
  pkg.installed:
    - name: {{ apache_pkg }}

start_apache:
  service.running:
    - name: {{ apache_pkg }}

add_welcomepage:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://files/index.html
