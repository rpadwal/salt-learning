include:
  - php

php-imagick:
  pkg:
    - installed

imagick-policy-update:
  file.line:
    - name: /etc/ImageMagick-6/policy.xml
    - match: |
        <policy domain="coder" rights="none" pattern="PDF" \/>
    - content: |
        <!-- <policy domain="coder" rights="none" pattern="PDF" /> -->
    - mode: replace
    - indent: True
    - quiet: True

{%- if 'vhost' in grains and grains['vhost'] == 'clientadmin' %}
imagick-eps-ps-rights:
  file.replace:
    - name: /etc/ImageMagick-6/policy.xml
    - pattern: 'rights=\"none\"\s*pattern=\"(EPS|PS)\"'
    - repl: 'rights="read|write" pattern="\1"'
{%- endif %}
