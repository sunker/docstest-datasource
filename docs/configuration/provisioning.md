---
title: Provisioning
description: Provision the DocsTest data source using YAML configuration files or Terraform.
sidebar_position: 4
---

# Provisioning

You can provision the DocsTest data source using Grafana's provisioning system instead of configuring it through the UI. This is useful for infrastructure-as-code workflows and automated deployments.

## YAML provisioning

Create a YAML file in your Grafana provisioning directory (typically `provisioning/datasources/`):

```yaml
apiVersion: 1

datasources:
  - name: DocsTest
    type: sunker-docstest-datasource
    access: proxy
    url: https://api.example.com/v1
    jsonData:
      defaultRegion: us-east-1
      maxConcurrentRequests: 5
    secureJsonData:
      apiKey: ${DOCSTEST_API_KEY}
```

### Configuration fields

| Field | Type | Description |
|-------|------|-------------|
| `url` | string | API endpoint URL |
| `jsonData.defaultRegion` | string | Default query region |
| `jsonData.maxConcurrentRequests` | number | Max parallel API requests |
| `secureJsonData.apiKey` | string | API key (stored encrypted) |

> **Tip:** Use environment variables (e.g., `${DOCSTEST_API_KEY}`) for sensitive values instead of hardcoding them.

## Terraform provisioning

If you manage Grafana with Terraform, use the `grafana_data_source` resource:

```hcl
resource "grafana_data_source" "docstest" {
  type = "sunker-docstest-datasource"
  name = "DocsTest"
  url  = "https://api.example.com/v1"

  json_data_encoded = jsonencode({
    defaultRegion          = "us-east-1"
    maxConcurrentRequests  = 5
  })

  secure_json_data_encoded = jsonencode({
    apiKey = var.docstest_api_key
  })
}
```

For more details, refer to the [Grafana provisioning documentation](https://grafana.com/docs/grafana/latest/administration/provisioning/).
