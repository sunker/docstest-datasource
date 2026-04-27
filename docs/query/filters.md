---
title: Filtering data
description: Filtering data
sidebar_position: 7
---

## Filtering data / Using template variables in Query

In order to filter the data in Infinity datasource, you can use the following options based on the parser you are using.

> **Note:** All filtering happens after retrieving the content. For better performance, use filtering provided by the API.

## Filtering with Backend Parser

When using the backend parser, use the following examples for filtering your data. In most cases, you will be filtering data based on single value or multiple value variable.

### Variable setup - single

![image](img/56b1ccb3-e351-4f2e-9d1a-008a1005a551.jpg)
![image](img/a09256a8-2b68-4334-ad8d-efc4164947f6.jpg)

### Variable setup - multi

![image](img/735d0d6a-82fc-412e-988c-109ec0cd20eb.jpg)
![image](img/df4f570b-e4c6-4075-a6e7-d5d814af390b.jpg)

### Without filter

![image](img/f000a467-40c2-4149-9a08-7a6a42fd39df.jpg)
![image](img/4f3e1e6e-b9fb-4aea-bc84-f48ea6d70ac0.jpg)
![image](img/171080c0-de0e-4c69-8b25-b572877726e3.jpg)

### With single filter

We are using the filter `region == "${region}"`

![image](img/08828e44-77f3-41fb-beca-6136805d8860.jpg)

### With multi filter

We are using the filter `region IN (${region_multi:singlequote})` to show multiple regions

![image](img/4fdbbd6d-8514-4730-96f3-998ee20f2182.jpg)

### With multi filter (NOT IN)

We are using the filter `!(region IN (${region_multi:singlequote})` to exclude multiple regions. As you see we use `!` symbol before our condition

![image](img/1438b99c-478a-459e-a6a2-513d5285326c.jpg)

## Filtering with UQL Parser

When using the backend parser, use the following examples for filtering your data. In most cases you will be filtering data based on single value or multiple value variable.

### UQL - Without filter

```uql
parse-json
| summarize count("name") by "region"
```

### UQL - With single filter

```uql
parse-json
| where "region" == '$region'
| summarize count("name") by "region"
```

### UQL - With single filter (JSONata)

```uql
parse-json
| jsonata "$[region='${region}']"
| summarize count("name") by "region"
```

### UQL - With multi filter

```uql
parse-json
| where "region" in (${region_multi:singlequote})
| summarize count("name") by "region"
```

### UQL - Multi filter (JSONata)

```uql
parse-json
| jsonata "$[region in [${region_multi:singlequote}]]"
| summarize count("name") by "region"
```

### UQL - Multi filter (NOT IN)

```uql
parse-json
| where "region" !in (${region_multi:singlequote})
| summarize count("name") by "region"
```

### UQL - Multi filter (NOT IN) (JSONata)

```uql
parse-json
| jsonata "$[$not(region in [${region_multi:singlequote}])]"
| summarize count("name") by "region"
```
