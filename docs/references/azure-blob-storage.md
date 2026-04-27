---
title: Querying Azure Blob Storage
description: Querying data from Azure Blob Storage
sidebar_position: 5
---

## Querying Azure Blob Storage

> This feature is available only from version 2.1.0

To retrieve JSON,CSV, TSV, or XML objects from Azure Blob Storage, you need to setup **Azure Blob Storage** authentication.

## Authentication

To retrieve content from Azure blob storage, you need to provide the following information in the configuration section.

- Choose "Azure Blob Storage" as authentication type
- Provide Azure storage account name
- Provide Azure storage account key ( either primary key or secondary key)

## Retrieving data from azure blob storage

In the query editor, provide the following details

- **Query Type**: json/csv/tsv/xml/html
- **Parser**: backend/uql
- **Source**: Azure Blob
- **Storage container name**:
