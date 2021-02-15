beacons:
  inotify:
    - files:
        /var/www/html/index.html:
          mask:
            - modify
    - disable_during_state_run: True
