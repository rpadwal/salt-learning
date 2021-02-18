slack-message:
  local.state.single:
    - tgt: {{ data['id'] }}
    - args:
      - fun: slack.post_message
      - name: 'Login Alert'
      - from_name: {{ data['id'] }}
      - message: Someone login to minion server {{ data['id'] }}
      - webhook: 'T01NKANG7PD/B01NRMNRJ3E/Os8Bz1rXWF0qTWORanfcM5eS'
