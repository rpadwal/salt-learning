check_pillar_value:
  test.check_pillar:
    - present:
      - nameX

add_welcomepage:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://files/index.html
    - template: jinja
