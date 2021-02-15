restore_welcome_page_config:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - args:
      - 'apache.install'
      - 'apache.welcome'
