include:
  - apache.install

apache-mod-ssl:
  apache_module.enabled:
    - name: ssl

apache-ssl-protocols:
  file.replace:
    - name: /etc/apache2/mods-enabled/ssl.conf
    - pattern: '^[#\ \t]*SSLProtocol.*$'
    - repl: '    SSLProtocol all -SSLv2 -SSLv3'
    - append_if_not_found: True
    - require:
      - apache_module: apache-mod-ssl
