restore_welcome_page_config:
  local.state.sls:
    - tgt: {{ data['id'] }}
    - arg:
      - apache.install, apache.welcome
