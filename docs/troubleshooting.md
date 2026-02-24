---
title: Troubleshooting
description: Solutions for common issues when using the DocsTest data source plugin.
sidebar_position: 6
---

# Troubleshooting

## Connection issues

### "Data source is not working" after Save & test

- Verify the **URL** is correct and reachable from the Grafana server.
- Check that the API key has the required [permissions](./configuration/permissions/).
- If using a proxy, ensure Grafana's network settings allow outbound connections to the API endpoint.

### Timeout errors

- Increase the **Timeout** value in the [connection settings](./configuration/configuration/).
- Check if the [Service Name] API is experiencing latency or outages.
- Reduce the query time range or add filters to reduce the response size.

## Query issues

### No data returned

- Verify the time range in Grafana includes data points in [Service Name].
- Check that the metric name and filters are correct.
- Test the same query in the [Service Name] UI to confirm data exists.

### "Permission denied" errors

- Verify the API key has the correct [permissions](./configuration/permissions/) for the query type.
- Check if the API key has expired or been revoked.

### Template variable dropdown is empty

- Check the variable query syntax matches one of the [supported formats](./template-variables/).
- Verify the data source selected for the variable is correct.
- Open the query inspector to see the raw API response.

## Performance issues

### Slow queries

- Add filters to reduce the amount of data returned.
- Use a larger aggregation interval for long time ranges.
- Reduce the **Max concurrent requests** setting if the API is rate-limited.

### Dashboard loads slowly

- Reduce the number of panels querying this data source simultaneously.
- Use caching if available on the [Service Name] API.
- Set a narrower default time range for the dashboard.

## Getting help

If the issue persists:

1. Open the **Query inspector** in Grafana to view the raw request and response.
1. Check the Grafana server logs for detailed error messages.
1. Search for existing issues or open a new one on the [plugin repository](https://github.com/example/docstest-datasource/issues).
