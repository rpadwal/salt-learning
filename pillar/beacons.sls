 beacons:
   inotify:
     - files:
 {% if grains['os_family']=="RedHat" %}
         /var/www/html/index.html:
 {% endif %}
 {% if grains['os_family']=="Debian" %}
         /var/www/html/index.html:
 {% endif %}
           mask:
             - modify
     - disable_during_state_run: True
