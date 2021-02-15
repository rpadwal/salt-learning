#!jinja|yaml|gpg

name:
{%- if grains.id == 'node01.salt.lcl' %}
  firstname: Rakesh
  middlename: Prakash
  lastname: Padwal
  server: {{ grains.id }}
{%- elif grains.id == 'node02.salt.lcl' %}
  firstname: Rajdatt
  lastname: Pawar
  server: {{ grains.id }}
{% endif %}

  password: |
    -----BEGIN PGP MESSAGE-----

    hQGMA8n2hD3Hv/sQAQwAsMHeIIPZoi4+xO4nJKfdmHJs3rzYMtgo6zDnEuEhQ5PY
    iHO2dekvxQHG109OR/xvIIgrmGZhperaH3H6/dEZYrjVke+BNFqui67pLgvB0XXN
    eUl74eX30ku802IL/kHvMmWeLvxUAqaUIXL70EM7oIeZ8TeoJu6w25cyB4eKCJyG
    CyDAv60K6vFayS10G64xvmIoE3gsC0j64IWU7fUydB3P4tLeLwxPpUHM2ZsIQ7yS
    qhIYRmO10cfPSoYViPX24YP2rJSNjYz76Y+dvBMnRjgYeWnuHSRjmAexmrbzsASs
    KpGXTBTyEfo56kD7uYVt8Vm25TAm+n2qb3Tjkn58jGQEihQg/iP8Za09Z1O4gIM5
    atnf7lCQA8y3R3WxlZpGnv3HVZUD9ZCMbNjan0mrI+0fYJgBDyjJz0RcX88pxJnA
    3EYkMRglREz3jD1wNpbgshpg0RbO6DbzPeohIcvWyQ3uZ9COYshj4+eZDgL2RTNR
    LDZLhhEQHqA+Iunw9YcT0kQBjqgll/FArghy/M0Als70dwgqumdIN2O7JtuC3rBB
    P+BpFEuSm6xwNIqzB7MAw3ftMUekjHEunzMGrnidvPhnESd9/Q==
    =z0IJ
    -----END PGP MESSAGE-----
