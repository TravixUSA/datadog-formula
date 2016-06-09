include:
{%- if salt[grains.get]('os','linux') == 'linux' %}
  - .repo
{%- endif %}
  - .install
  - .service
  - .configure
