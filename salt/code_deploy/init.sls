myapp:
  git.latest:
    - name: https://github.com/rpadwal/learning-git1.git
    - rev: HEAD
    - target:

notify_of_fail:
  event.send:
    - name: myapp/fail_deploy
    - onfail:
      - git: myapp
