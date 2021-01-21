myapp:
  git.latest:
    - name: https://github.com/rpadwal/learning-git1.git
    - rev: HEAD
    - target: /var/www/myapp

notify_of_fail:
  event.send:
    - name: myapp/fail_deploy
    - onfail:
      - git: myapp
