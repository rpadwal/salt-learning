mssql-php-repo:
  pkgrepo.managed:
    - humanname: Microsoft SQL Server PHP tools repository
    - name: deb https://packages.microsoft.com/ubuntu/16.04/prod xenial main
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
    - file: /etc/apt/sources.list.d/php-mssql.list

mssql-php-environvar:
  environ.setenv:
    - name: ACCEPT_EULA
    - value: Y

mssql-php-pkgs:
  pkg.installed:
    - pkgs:
      - mssql-tools
      - msodbcsql
