sqlsrv-install-prerequisites:
  pkg.installed:
    - pkgs:
      - php-pear
      - php-dev
      - unixodbc
      - unixodbc-dev

sqlsrv:
  pecl.installed:
    - require:
      - pkg: sqlsrv-install-prerequisites

pdo_sqlsrv:
  pecl.installed:
    - require:
      - pkg: sqlsrv-install-prerequisites
