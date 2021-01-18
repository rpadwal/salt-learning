name:
{%- if grains.id == 'salt.node01.lcl' %}
  firstname: Rakesh
  middlename: Prakash
  lastname: Padwal
  server: {{ grains.id }}
{%- elif grains.id == 'salt.node02.lcl' %}
  firstname: Rajdatt
  lastname: Pawar
  server: {{ grains.id }}
{% endif %}
