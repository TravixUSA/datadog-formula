{%- from slspath + "/map.jinja" import datadog with context %}
{# This state installs the package #}
{%- if salt[grains.get]('os','linux') == 'linux' %}
include:
  - .repo
{%- endif %}

datadog_install:
  pkg.installed:
    - name: {{ datadog.pkg }}
{%- if salt[grains.get]('os','linux') == 'linux' %}
    - require:
      - pkgrepo: datadog_repo
{%- endif %}
