{% if salt['grains.get']('environment') != 'lcl' %}
satis_dns_update:
  ddns.present:
    - name: composer{{ '-tst' if salt['grains.get']('environment') == 'tst' else '' }}
    - zone: entrata.com
    - data: {{ salt['grains.get']('myip') }}
    - nameserver: {{ salt['pillar.get']('dns:server1') }}
    - ttl: 3600
{% endif %}
