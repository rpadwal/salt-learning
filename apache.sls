install_apache:
  pkg.installed:
    - name: apache2

start_apache:
  service.running:
    - name: apache2

add_welcomepage:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://files/index.html
