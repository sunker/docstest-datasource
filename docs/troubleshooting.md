---
title: Troubleshooting
description: Troubleshoot the Clock panel.
sidebar_position: 5
---

## Panel shows "This panel does not use a datasource query but one is configured"

Clock shows this notice when Mode is Time, or when Countdown/Countup Source is set to Input, but the panel still has a datasource or query attached - typically left over from before you switched to Input mode.

Open the Query tab and remove all queries from the panel. Clock doesn't need a datasource at all when it isn't reading a target time or description from a query.

## Countdown or countup shows "no value found"

This is the configured No Value Text, shown when Clock can't find a target time. It appears when:

- Source is Query, but the query hasn't returned data yet, returned no series, or none of the returned fields match the name set in Field.
- Source is Input, but End Time or Begin Time is empty.

Check that Field (under Countdown or Countup) matches a field name actually present in your query result, and that the query returns data. Refer to [Data formats](./data-formats.md) for the field-mapping contract.

## Countdown or countup shows "invalid value"

This is the configured Invalid Value Text, shown when Clock found a target time value but couldn't parse it as a valid date or time. Check the values in the field you selected as Field - Clock parses them with [moment](https://momentjscom.readthedocs.io/en/latest/), so values need to be in a format moment recognizes (for example ISO 8601).

## Panel shows a red error triangle

A red triangle in the top-left corner means the datasource itself returned an error - Clock reports it, but doesn't cause it. This usually happens when a datasource is attached to the panel but its query is empty or misconfigured.

- Open the Query tab and delete the query if the panel doesn't need one.
- If you do need query-driven behavior, fix the query so it returns data, or switch to the Grafana built-in datasource, which never errors even when idle.
