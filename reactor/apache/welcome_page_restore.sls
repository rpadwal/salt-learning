restore_welcome_page_config:
  local.state.single:
    - tgt: '*'
    - args:
      - fun: file.managed
      - name: /var/www/html/index.html
      - source: salt://files/index.html
