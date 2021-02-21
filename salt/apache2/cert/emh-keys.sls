{% for keyid, values in salt.pillar.get('emh-keys', {}).items() %}
/etc/ssl/identrust/{{ values.key.name }}:
  file.managed:
    - template: jinja
    - mode: 640
    - user: www-data
    - group: www-data
    - makedirs: True
    - contents_pillar: emh-keys:{{ keyid }}:key:value
{% endfor %}
