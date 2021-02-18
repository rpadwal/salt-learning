slack-message:
  local.state.single:
    - tgt: {{ data['id'] }}
    - args:
      - fun: slack.post_message
      - name: 'Login Alert'
      - from_name: {{ data['id'] }}
{% if  data['action'] == 'logout' %}
      - message: User {{ data['user'] }} {{ data['action'] }} from {{ data['id'] }} server
{% else %}
      - message: User {{ data['user'] }} {{ data['action'] }} to {{ data['id'] }} server
{% endif %}
      - webhook: 'T01NKANG7PD/B01NRMNRJ3E/Os8Bz1rXWF0qTWORanfcM5eS'
