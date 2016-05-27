{# This state configures the package #}
{%- from slspath + "/map.jinja" import datadog with context %}
{%- set slspath = slspath %}
{%- set integrations = datadog.get('integrations', {}) %}
include:
  - .install
  - .service

datadog_configure:
  file.managed:
    - name: /etc/dd-agent/datadog.conf
    - source: salt://{{ slspath }}/files/datadog.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        slspath: {{ slspath  }}
    - require:
      - pkg: datadog_install
    - watch_in:
      - service: datadog_service

{%- for integration in integrations %}
datadog_integration_{{ integration }}:
  file.managed:
    - name: /etc/dd-agent/conf.d/{{ integration }}.yaml
    - source: salt://{{ slspath }}/files/{{ integration }}.yaml.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: datadog_install
      - file: datadog_configure
    - watch_in:
      - service: datadog_service
{%- endfor %}
