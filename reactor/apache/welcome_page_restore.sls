restore_welcome_page_config:
  local.state.sls:
    - tgt: {{ data['id'] }}
    - kwarg
        mods:
          apache.welcome'
        test: False
