include:
  - apache.install
  - .adminsync
  - .common
  - .entrataleasing
  - .gateway
  - .medialibrary
  - .residentinsure
  - .residentpay
  - .residentsync {# Deprecated. Enabled to allow for file.remove of vhost files #}
  - .residentverify
  - .sms
  - .system
  - .vendoraccess
  - .reservationhub
{%- if salt.grains.get('track') == 'rapid' %}
  - .wwwentrata
  - .deploy-entrata
  - .agentaccessglobal
  - .elevate
{%- endif %}
