restore_welcome_page_config:
  local.state.sls:
    - tgt: '*'
    - args:
      - 'apache'
      - 'apache.welcome'
