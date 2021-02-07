#!jinja|yaml|gpg

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

  password: |
    -----BEGIN PGP MESSAGE-----

    hQGMAwAAAAAAAAAAAQv/c85YLFFH9xiG4QIAEeR5G9IMjH395duBcMoBVR5qkPq1
    gpr/OCyQG1GUp4ebr2Aqv+P6IIVUTxmkEeLrqvtu5JpBhnJZH1MkqiPLPcheEVBT
    emcLq2tlpK5Y6f1j2g2lNIW2keRGm/hOJr188Zm7FzSLeFIBAtxUsqVn0NYjHX65
    /8xMBPZx1WnSIqqTVC36of6CNDlkGo/jpptWwX1Fp11E5xTofdsPs0hXYcqZ7+hY
    H3YTveA3o0KqbPMtUd3/KHecFw8i0AmnELDlSPZpOXqQ4hEtCejAsQSUky1Bj8RB
    c23P/2IW2sz3w1ykBdJCDEdVn+GrG6zL6uX0AdoYGLxtLENNL1runW+UfRZVEyEu
    OMr2j3Y3GmUhs2nAbm2WaJ7MtRfdjTBhUsb8kCI1bymmso4rHUtROSn+9bOnC7ET
    mZb+HTzzMxmXKsGBF4wStSScaQj08EbFMIX/LsdvX5dNAmUkj69GBHkS0q0zZnp9
    P1/SSFFAY2yJQjdqeicn0kMBQAw/qHsV8ifw3aeZWwhX0Osl4n6RZV7KLP10RKnc
    81OUCI4HGPHmQcZ9PKclk0p8tm40Ls72iqdQQ5S5RQ3l0mWk
    =zG52
    -----END PGP MESSAGE-----  
