{%- from slspath + "/map.jinja" import datadog with context %}
{%- if salt['grains.get']('os','linux') == 'linux' %}
datadog_repo_purge:
  pkgrepo.absent:
    - humanname: {{ datadog.repo.human_name }}
    - name: {{ datadog.repo.name }}
    - file: {{ datadog.repo.file }}
{%- endif %}

datadog_pkg_purge:
  pkg.purged:
    - name: {{ datadog.pkg }}
