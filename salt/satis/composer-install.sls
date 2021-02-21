install-composer:
  file.managed:
    - name: /usr/local/bin/composer
    - source: salt://satis/files/composer.phar
    - mode: 0755
    - user: satis
    - group: satis
