---
title: Options
description: Reference for Clock panel options.
sidebar_position: 3
---

Clock's panel editor exposes only custom options - it doesn't enable any of Grafana's standard field options (Min, Max, Unit, Thresholds, and so on).

## Panel options

### General

| Option           | Type   | Default | Description |
| ---------------- | ------ | ------- | ----------- |
| Mode             | Radio  | `time`  |             |
| Style            | Radio  | `text`  |             |
| Refresh          | Radio  | `sec`   |             |
| Background Color | Custom |         |             |
| Font monospace   | Toggle | `false` |             |

Mode chooses between Time, Countdown, and Countup. Style chooses between the text clock and the digital (SVG) clock. Refresh chooses between updating every second and updating only when the dashboard refreshes.

### Countdown

Shown when Mode is set to Countdown.

| Option             | Type   | Default                                     | Description                         |
| ------------------ | ------ | ------------------------------------------- | ----------------------------------- |
| Source             | Radio  | `input`                                     |                                     |
| End Time           | Text   | `dateTime(Date.now()).add(6, 'h').format()` |                                     |
| Calculation        | Select | `last`                                      | How to calculate the countdown time |
| Field              | Custom |                                             |                                     |
| End Text           | Text   | `00:00:00`                                  |                                     |
| No Value Text      | Text   | `no value found`                            |                                     |
| Invalid Value Text | Text   | `invalid value`                             |                                     |
| Custom format      | Text   |                                             |                                     |

Source chooses whether End Time comes from a fixed value you enter (Input) or from a query (Query). Field and Calculation only apply when Source is Query - refer to [Data formats](./data-formats.md) for how Clock reads the query result.

### Countup

Shown when Mode is set to Countup. Mirrors the Countdown options above.

| Option             | Type   | Default                                     | Description                       |
| ------------------ | ------ | ------------------------------------------- | --------------------------------- |
| Source             | Radio  | `input`                                     |                                   |
| Begin Time         | Text   | `dateTime(Date.now()).add(6, 'h').format()` |                                   |
| Calculation        | Select | `last`                                      | How to calculate the countup time |
| Field              | Custom |                                             |                                   |
| Begin Text         | Text   | `00:00:00`                                  |                                   |
| No Value Text      | Text   | `no value found`                            |                                   |
| Invalid Value Text | Text   | `invalid value`                             |                                   |
| Custom format      | Text   |                                             |                                   |

### Description

| Option        | Type   | Default                | Description |
| ------------- | ------ | ---------------------- | ----------- |
| Source        | Radio  | `none`                 |             |
| Description   | Text   |                        |             |
| Field         | Custom |                        |             |
| No Value Text | Text   | `no description found` |             |
| Font size     | Text   | `12px`                 |             |
| Font weight   | Radio  | `normal`               |             |

Source chooses whether Clock shows no description, static text you enter (Description), or - when the current mode's target time is query-driven - text pulled from a string field in the query result (Field).

### Time Format

| Option      | Type  | Default   | Description                 |
| ----------- | ----- | --------- | --------------------------- |
| Clock Type  | Radio | `24 hour` |                             |
| Time Format | Text  |           | the date formatting pattern |
| Font size   | Text  | `12px`    |                             |
| Font weight | Radio | `normal`  |                             |

Time Format only applies when Clock Type is set to Custom.

### Timezone

| Option         | Type   | Default      | Description |
| -------------- | ------ | ------------ | ----------- |
| Timezone       | Select |              |             |
| Show Timezone  | Toggle | `false`      |             |
| Display Format | Select | `offsetAbbv` |             |
| Font size      | Text   | `12px`       |             |
| Font weight    | Radio  | `normal`     |             |

Timezone accepts a specific IANA timezone name, `dashboard` to match the dashboard's timezone, or leave it unset to use the browser's timezone. Display Format and the font options only apply when Show Timezone is on.

### Date Options

| Option      | Type   | Default      | Description |
| ----------- | ------ | ------------ | ----------- |
| Show Date   | Toggle | `false`      |             |
| Date Format | Text   | `YYYY-MM-DD` |             |
| Locale      | Text   |              |             |
| Font size   | Text   | `20px`       |             |
| Font weight | Radio  | `normal`     |             |

Date Format, Locale, and the font options only apply when Show Date is on.

### Digital Options

Shown when Style is set to Digital.

| Option       | Type   | Default                | Description |
| ------------ | ------ | ---------------------- | ----------- |
| Fill Color   | Custom | `DEFAULT_FILL_COLOR`   |             |
| Stroke Color | Custom | `DEFAULT_STROKE_COLOR` |             |
| Stroke Width | Slider | `0`                    |             |
| Glow Size    | Slider | `0`                    |             |
