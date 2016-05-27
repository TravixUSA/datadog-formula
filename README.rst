===============
Datadog formula
===============

Installs and configures the Datadog agent.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``init``
--------

Includes all the others; Installs and configures the ``datadog-agent`` package
and enables the service.

``repo``
--------------

Configures the official datadog deb repository.

``install``
-----------

Installs the ``datadog-agent`` package.

``service``
-----------

Enables and starts the ``datadog-agent`` service.

``configure``
-------------

Manages the ``datadog-agent`` configuration files.


Configuration parameters
========================

.. contents::
    :local:

Work in progress


Example pillar
==============

Work in progress

.. code-block:: yaml

   service:
     server:
       source:
         engine: 'git'

