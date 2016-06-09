{%- from slspath + "/map.jinja" import datadog with context %}
{# This state enables and starts the datadog-agent service #}
include:
  - .install

datadog_service:
  service.running:
    - name: {{ datadog.service }}
    - enable: True
    - require:
      - pkg: datadog_install
