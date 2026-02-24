---
title: Permissions
description: Required permissions and roles for connecting Grafana to your service.
sidebar_position: 2
---

# Permissions

<!-- Describe the permissions required on the external service, not Grafana RBAC. -->

The DocsTest data source requires specific permissions on your **[Service Name]** account to function correctly.

## Required roles

<!-- List the minimum roles or permissions needed. -->

| Permission | Description | Required for |
|-----------|-------------|-------------|
| `read:data` | Read access to query data | All queries |
| `read:metadata` | Read access to metadata and schemas | Query builder autocomplete |
| `read:events` | Read access to events | Annotation queries |

## Creating an API key

<!-- Step-by-step instructions for generating credentials on the external service. -->

1. Log in to your [Service Name] account.
1. Navigate to **Settings** > **API keys**.
1. Click **Create new key**.
1. Select the required permissions listed above.
1. Copy the generated key and store it securely.

> **Note:** The API key is only displayed once. If you lose it, you must generate a new one.

## Least-privilege recommendations

For production environments, create a dedicated read-only service account rather than using a personal account. This limits the blast radius if the credentials are compromised and makes it easier to audit access.
