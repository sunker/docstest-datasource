---
title: Data formats
description: Learn what data formats the Clock panel accepts.
sidebar_position: 2
---

Clock only reads query data when you set Mode to Countdown or Countup and Source to Query for that mode. In every other case (Time mode, or Countdown/Countup with Source set to Input) Clock ignores any query results and you don't need a datasource at all.

## Supported data shape

When a countdown or countup target comes from a query, Clock reads two fields from the returned data frames:

- A target-time field: any field whose values Clock can parse as a date or time. You select this field by name in the panel editor (Countdown or Countup category, Field option).
- An optional description field: a string-typed field, used only when Description source is set to Query. You select this field by name in the Description category.

Clock scans all series in the response for a field matching the selected name and uses the first match it finds. If no series contains a field with that name, or the response has no data, Clock shows the configured "No Value Text" instead of a target time.

#### Example

| datetime   | label         |
| ---------- | ------------- |
| 2020-01-01 | New Year 2020 |
| 2021-01-01 | New Year 2021 |
| 2022-01-01 | New Year 2022 |
| 2023-01-01 | New Year 2023 |
| 2024-01-01 | New Year 2024 |

In this example, `datetime` is the target-time field and `label` is the description field.

## Field mapping

You choose both fields explicitly in the panel editor - Clock doesn't infer field roles automatically:

- **Field** (under Countdown or Countup): the name of the field to read the target time from.
- **Field** (under Description, only shown when Description source is Query): the name of the string field to read the description text from.

Set Calculation (under Countdown or Countup) to control which row Clock picks when the query returns multiple rows: Last, Last non-null, First, First non-null, Min, Max, and mode-specific options (Min Future for Countdown, Max Past for Countup) that filter out rows before or after the current time.
