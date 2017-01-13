{%- from slspath + "/map.jinja" import datadog with context %}
{%- if salt['grains.get']('os_family','') == 'Debian' %}
datadog_repo_purge:
  pkgrepo.absent:
    - humanname: {{ datadog.repo.human_name }}
    - name: {{ datadog.repo.name }}
    - file: {{ datadog.repo.file }}

{# quirk in current saltstack makes us hacky #}
datadog_repo_purge_file:
  file.absent:
    - name: {{ datadog.repo.file }}
    - onfail:
      - pkgrepo: datadog_repo_purge
{%- endif %}

datadog_pkg_purge:
  pkg.purged:
    - name: {{ datadog.pkg }}
