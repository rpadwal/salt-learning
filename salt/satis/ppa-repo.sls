php-ppa-repo:
  pkgrepo.managed:
    - name: deb http://entrata-aptly-repo.s3-website-us-east-1.amazonaws.com/php/{{ grains.oscodename }} {{ grains.oscodename }} main
    - file: /etc/apt/sources.list.d/ondrej-ubuntu-php-{{ grains.oscodename }}.list
