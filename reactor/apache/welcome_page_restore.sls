restore_welcome_page_config:
  local.state.sls:
    - tgt: '*'
    - args:
      - 'apache.install'
      - 'apache.welcome'
