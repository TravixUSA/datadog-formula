include:
{%- if not 'datadog' in salt['grains.get']('roles',[]) %}
  - .purge
{% else %}
  {%- if salt['grains.get']('os','linux') == 'linux' %}
  - .repo
  {%- endif %}
  - .install
  - .service
  - .configure
{%- endif %}
