---
title: Template variables
description: Use Grafana template variables with DocsTest queries for dynamic dashboards.
sidebar_position: 5
---

# Template variables

Template variables let you create dynamic, reusable dashboards. Instead of hardcoding values like region or source, use variables that users can change from dropdown menus at the top of the dashboard.

## Creating a variable

1. Open your dashboard and click **Dashboard settings** (gear icon).
1. Select **Variables** from the sidebar.
1. Click **New variable**.
1. Set **Type** to **Query**.
1. Select **DocsTest** as the data source.
1. Enter a query that returns the values you want in the dropdown.

## Variable queries

The DocsTest data source supports these variable query formats:

| Query | Description | Example result |
|-------|-------------|---------------|
| `regions()` | Returns all available regions | `us-east-1`, `eu-west-1` |
| `sources(region)` | Returns sources for a region | `server-01`, `server-02` |
| `metrics()` | Returns all available metric names | `cpu_usage`, `memory_used` |

## Using variables in queries

Reference variables with the `$variable` or `${variable}` syntax.

### Query builder

Select the variable from any dropdown that supports it. Variable-backed dropdowns show a `$` prefix.

### Code editor

Use variables directly in the query text:

```
SELECT timestamp, value
FROM $metric
WHERE region = '$region'
  AND source IN ($source)
```

## Multi-value variables

When a variable allows multiple selections, the values are automatically formatted:

- **In `IN` clauses**: `$source` becomes `'server-01','server-02'`
- **In equality checks**: `$source` uses the first selected value

> **Tip:** Use the `IN` operator with multi-value variables for correct behavior.

## Example: Region and source selectors

Create two variables to let users filter by region and source:

1. Variable `region` with query: `regions()`
2. Variable `source` with query: `sources($region)` (depends on the region variable)

This creates a cascading filter where changing the region updates the source dropdown automatically.
