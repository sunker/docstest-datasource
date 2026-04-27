---
title: Annotations
description: Annotations
sidebar_position: 1
---

## Annotations

![image](img/122909970-9de67200-d34d-11eb-96d3-2c236d8a7a5d.jpg)

You can annotate data from an API using Grafana's annotations feature. To add annotations, select the Infinity data source as your annotation source. You can create annotation from JSON, CSV, XML, or GraphQL endpoints. The source of annotation can be inline or a remote URL as well.

> Make sure to select "Data Frame" as format.

To create annotations, you need to specify a time field and a string field. Make sure your query returns at least these two fields:

![image](img/122910054-b191d880-d34d-11eb-9077-14a3b260c333.jpg)

> Annotations are supported from plugin version 0.7.4.
