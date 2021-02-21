include:
  - .entrata-site
  - base-packages.rng-tools
{%- if salt.grains.get('track') == 'rapid' %}
  - .tenants
{%- endif -%}
