{%- from slspath + "/map.jinja" import datadog with context %}
{# This state configures the package repository #}
datadog_repo:
  pkgrepo.managed:
    - humanname: {{ datadog.repo.human_name }}
    - name: {{ datadog.repo.name }}
    - keyserver: {{ datadog.repo.keyserver }}
    - keyid: {{ datadog.repo.keyid }}
    - file: {{ datadog.repo.file }}
