{# This state enables and starts the datadog-agent service #}
include:
  - .install

datadog_service:
  service.running:
    - name: datadog-agent
    - enable: True
    - require:
      - pkg: datadog_install
