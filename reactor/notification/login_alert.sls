slack-message:
  local.state.single:
    - tgt: {{ data['id'] }}
    - args:
      - fun: slack.post_message
      - name: 'LoginAlert'
    - kwarg:
      - from_name: {{ data['id'] }}
      - message: 'Someone login to minion server.'
      - webhook: 'T01NKANG7PD/B01NRMNRJ3E/Os8Bz1rXWF0qTWORanfcM5eS'
