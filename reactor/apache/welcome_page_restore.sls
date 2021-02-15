restore_welcome_page_config:
  local.state.apply:
    - tgt: '*'
    - args:
      - 'apache.welcome'
