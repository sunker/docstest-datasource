---
title: Infinity data source plugin for Grafana
description: The Infinity data source plugin allows you to query and visualize data from JSON, CSV, GraphQL, XML, and HTML endpoints.
---

## Overview

A universal data source plugin for pulling data from various systems into Grafana using existing REST APIs. Grafana's go-to plugin for cases when a native plugin doesn't exist yet.

[Watch on YouTube: Get started with the Grafana Infinity data source plugin](https://www.youtube.com/watch?v=BxWw4BWY5ns)

[Try it live: Infinity plugin demo](https://play.grafana.org/d/infinity)

## Key Features

The Infinity data source supports the following key features:

- Bring data from multiple sources into Grafana
- Flexible data manipulation with UQL, JSONata, GROQ
- Various data formats such as JSON, CSV
- Various authentication methods
  - Basic authentication
  - Bearer token authentication
  - API key authentication
  - OAuth passthrough
  - OAuth2 client credentials
  - OAuth2 JWT authentication
  - AWS/Azure/GCP authentication
  - Digest authentication
- Alerting, recorded queries, shared dashboards, query caching
- Utility variable functions
- Grafana node graph panel, annotations, and so on

## Supported data formats

- [JSON](./json.md) - Visualize JSON data
- [CSV / TSV](./csv.md) - Visualize CSV, TSV or any delimited content
- [XML / HTML](./xml.md) - Visualize XML / HTML data
- [GraphQL](./graphql.md) - Visualize data from GraphQL endpoints

## Known Limitations

Infinity plugin has the following known limitations:

- Backend features such as alerting, shared dashboards, recorded queries or enterprise query caching only available in **backend** parsing mode.
- Infinity is not designed for handling a huge amount of data. When inlining the data, make sure they are small snippets less than 1MB of size.
- For a list of all known bugs, check [GitHub](https://github.com/grafana/grafana-infinity-datasource/issues).
