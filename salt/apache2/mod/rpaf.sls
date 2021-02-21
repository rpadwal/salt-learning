unzip:
  pkg.installed

build-essential:
  pkg.installed

apache2-dev:
  pkg.installed

install-mod-rpaf:
  cmd.run:
    - name: |
        cd /tmp
        wget -c https://github.com/gnif/mod_rpaf/archive/stable.zip
        unzip stable.zip
        cd mod_rpaf-stable
        make
        make install
    - cwd: /tmp
    - shell: /bin/sh
    - timeout: 300
    - unless: test -e /usr/lib/apache2/modules/mod_rpaf.so

/etc/apache2/mods-available/rpaf.load:
  file.managed:
    - source: salt://apache/mod/files/rpaf.load
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/mods-available/rpaf.conf:
  file.managed:
    - source: salt://apache/mod/files/rpaf.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2
      
rpaf:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
