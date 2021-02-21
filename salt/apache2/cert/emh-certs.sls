{% for cert, values in salt.pillar.get('emh-cert', {}).items() %}
/etc/ssl/certs/{{ values.cert.name }}:
  file.managed:
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - contents_pillar: emh-cert:{{ cert }}:cert:value
{% endfor %}
