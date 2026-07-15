---
title: "Operator-Lifecycle-Manager (OLM)"
date: 2019-06-18T16:42:20+02:00
lastmod: 2019-06-18T16:42:20+02:00
publishdate: 2019-06-18T16:42:20+02:00
draft: false
weight: 24
---

# Disable default OperatorHub sources

This is useful for disconnected, restricted, or curated clusters where you
want to expose only the `CatalogSource` objects that your administrators
explicitly manage.

Disable the default OperatorHub sources:

```
oc patch operatorhub.config.openshift.io/cluster -p='{"spec":{"disableAllDefaultSources":true}}' --type=merge
```

Re-enable the default sources:

```
oc patch operatorhub.config.openshift.io/cluster -p='{"spec":{"disableAllDefaultSources":false}}' --type=merge
```
