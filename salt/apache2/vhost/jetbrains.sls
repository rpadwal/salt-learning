include:
  - apache.install
  - apache.cert.star-entrata-com
  - apache.mod.proxy
  - apache.mod.headers
  - apache.vhost.default

/etc/apache2/sites-available/jetbrains.conf:
  file.managed:
    - source: salt://apache/vhost/files/jetbrains.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/jetbrains.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/jetbrains.conf
    - force: True
    - listen_in:
      - service: apache2

allow-localhost:
  iptables.append:
    - chain: INPUT
    - jump: ACCEPT
    - match:
        - comment
    - comment: "Allow HTTP"
    - in-interface: 'lo'
    - dport: 8080
    - proto: tcp
    - save: True

deny-everyone-else:
  iptables.append:
    - chain: INPUT
    - jump: REJECT
    - match:
      - comment
    - comment: "Allow HTTP"
    - dport: 8080
    - proto: tcp
    - save: True
