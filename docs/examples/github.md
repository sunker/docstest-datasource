---
title: Github GraphQL API
description: Visualizing data from Github GraphQL API using Infinity
sidebar_position: 3
---

## Visualizing data from Github GraphQL API

![image](img/93846498-1d9abf80-fc9c-11ea-90ed-4c569b088d99.jpg)

We can use the [GitHub GraphQL API](https://docs.github.com/en/graphql) to query the GitHub stats with the Infinity plugin GraphQL API.

A sample query is provided in the example below, but you can customize your query to bring the stats you needed:

## Query Editor

![image](img/93736996-d3510a00-fbd9-11ea-8c05-065758d66e82.jpg)

![image](img/93737011-e1068f80-fbd9-11ea-8c82-ea516f83cf3d.jpg)

Query Used:

```graphql
{
  repository(owner: "$GithubUser", name: "$GithubRepo") {
    issues(last: 20) {
      edges {
        node {
          author {
            login
          }
          state
          title
          url
        }
      }
    }
  }
}
```

## Datasource Configuration

Select **Basic user authentication** mode and use your GitHub username as the username and your Personal Access Token (PAT) as the password.

![image](img/93736929-b1578780-fbd9-11ea-9413-5585ff79d3a8.jpg)

## Github Organization Summary example

![image](img/93846498-1d9abf80-fc9c-11ea-90ed-4c569b088d99.jpg)

The preceding image uses the following query:

```graphql
{
  repositoryOwner(login: "$GithubUser") {
    repositories(first: 100) {
      data: nodes {
        name
        stargazers {
          totalCount
        }
        openissues: issues(states: OPEN) {
          totalCount
        }
        openpr: pullRequests(states: OPEN) {
          totalCount
        }
      }
    }
  }
}
```

Note:

- Queries aren't paginated.
- Github rate limits apply.
- If you need a paginated and full set of results, use Grafana [GitHub stats plugin](https://grafana.com/grafana/plugins/grafana-github-datasource).
