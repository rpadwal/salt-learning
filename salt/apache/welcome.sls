add_welcomepage:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://salt/files/index.html
