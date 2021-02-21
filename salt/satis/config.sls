include:
  - .composer-install
  - .satis-install

/var/www/html/satis-packages.conf:
  file.managed:
    - source: salt://satis/files/satis-packages.conf
    - mode: 640
    - user: satis
    - group: satis
    - require:
      - file: install-composer
      - cmd: install-satis
    - unless: ls -lh /var/www/html/repository/packages.json

## Temp patch to allow building single packages until fixed in source
satis-packageselection-patch:
  file.patch:
    - name: /var/www/html/satis/src/PackageSelection/PackageSelection.php
    - source: salt://satis/files/PakageSelection.patch
    - require:
      - file: /var/www/html/satis-packages.conf

build-packages:
  module.run:
    - name: satis.build
    - runas: satis
