install_apache:
  pkg.installed:
    {% if salt.grains.get('os_family') == 'Debian' %}
    - name: apache2
    {% elif salt.grains.get('os_family') == 'RedHat' %}
    - name: httpd

start_apache:
  service.running:
    - name: apache2

add_welcomepage:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://files/index.html
