set_hostname:
  salt.function:
    - name: network.mod_hostname
    - tgt: 'node01.salt.lcl'
    - arg:
      - node01.salt1.lcl
