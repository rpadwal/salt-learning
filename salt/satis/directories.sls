/var/www/html/repository:
  file.directory:
    - dir_mode: 755
    - user: satis
    - group: satis
    - makedirs: True

/var/www/html:
  file.directory:
    - dir_mode: 755
    - user: satis
    - group: satis
    - makedirs: True
