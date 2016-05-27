{%- from slspath + "/map.jinja" import datadog with context %}
{# This state installs the package #}
include:
  - .repo

datadog_install:
  pkg.installed:
    - name: {{ datadog.pkg }}
    - require:
      - pkgrepo: datadog_repo
