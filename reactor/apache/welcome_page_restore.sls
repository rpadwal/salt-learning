restore_welcome_page_config:
  local.state.sls:
    - tgt: {{ data['id'] }}
    - args:
      - apache.install,apache.welcome
