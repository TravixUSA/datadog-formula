{# This state configures the package #}
{%- from slspath + "/map.jinja" import datadog with context %}
{%- set slspath = slspath %}
{%- set integrations = datadog.get('integrations', {}) %}
include:
  - .install
  - .service

datadog_configure:
  file.managed:
    - name: {{ datadog.config_dir }}/datadog.conf
    - source: salt://{{ slspath }}/files/datadog.conf.jinja
    - template: jinja
    - user: dd-agent
    - group: root
    - mode: 644
    - context:
        slspath: {{ slspath  }}
    - require:
      - pkg: datadog_install
    - watch_in:
      - service: datadog_service

{%- for integration, options in integrations.iteritems() %}
  {%- if options.get('enabled') %}
datadog_integration_{{ integration }}:
  file.managed:
    - name: {{ datadog.config_dir }}/conf.d/{{ integration }}.yaml
    - source: salt://{{ slspath }}/files/{{ integration }}.yaml.jinja
    - template: jinja
    - user: dd-agent
    - group: root
    - mode: 644
    - context:
        slspath: {{ slspath  }}
    - require:
      - pkg: datadog_install
      - file: datadog_configure
    - watch_in:
      - service: datadog_service
  {%- endif %}
{%- endfor %}
