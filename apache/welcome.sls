add_welcomepage:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://files/index.html
