---
title: Overview
description: Learn about the Clock plugin.
sidebar_position: 1
---

Clock displays the current time, or counts down or up to a target moment, directly on your dashboard. Use it to show the time in another office, run a countdown to a deadline or launch, or track how long it's been since an event started.

## Features

- Displays the current time, or counts down or up to a target time
- Sets the countdown or countup target from a fixed date and time, or from a datasource query
- Renders as a classic text clock or as a digital (SVG) display with configurable fill, stroke, and glow colors
- Shows an optional date and timezone alongside the time
- Shows an optional description alongside the time, either static text or a value pulled from a query
- Formats time, date, and timezone using any locale or explicit timezone
- Refreshes every second, or only when the dashboard refreshes
- Available in 19 languages

## Requirements

Clock requires Grafana 11.0.0 or later.

Clock works without a datasource when you set the countdown or countup target manually. To drive the target time from a query, use any datasource that returns a time-typed field.
