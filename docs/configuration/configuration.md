---
title: Connection settings
description: Reference for all configuration options available on the data source connection page.
sidebar_position: 3
---

# Connection settings

<!-- Document each field on the data source configuration page. -->

After [adding the data source](./add-a-data-source/), configure the following settings on the connection page.

![Connection settings page](../img/configuration.png)

## Connection

| Setting | Description |
|---------|-------------|
| **URL** | The base URL of your [Service Name] API endpoint. Example: `https://api.example.com/v1` |
| **Timeout** | Request timeout in seconds. Default: `30` |

## Authentication

| Setting | Description |
|---------|-------------|
| **API Key** | The API key generated from your [Service Name] account. See [Permissions](./permissions/) for required scopes. |

<!-- Add additional auth methods if supported. -->

To configure authentication:

1. Enter your API key in the **API Key** field.
1. Click **Save & test**.
1. Verify the connection succeeds with the message: _"Data source is working"_.

## Additional settings

| Setting | Description | Default |
|---------|-------------|---------|
| **Default region** | The default region for queries. Can be overridden per query. | `us-east-1` |
| **Max concurrent requests** | Maximum number of parallel requests to the API. | `5` |
