include:
  - .composer-install
  - .dependencies
  - .directories

install-satis:
  cmd.run:
    - name: composer create-project composer/satis --stability=dev
    - cwd: /var/www/html
    - env:
      - COMPOSER_HOME: /var/www/html/
    - runas: satis
    - require:
      - file: install-composer
      - file: /var/www/html/repository
    - unless:
      - ls -lh /var/www/html/satis/composer.lock
