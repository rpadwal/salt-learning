beacons:
  inotify:
    - files:
        /var/www/html/index.html:
          mast:
            - modify
    - disable_during_state_run: True
