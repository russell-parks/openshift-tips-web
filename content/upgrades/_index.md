---
title: "Upgrades"
date: 2019-06-18T16:42:20+02:00
lastmod: 2019-06-18T16:42:20+02:00
publishdate: 2019-06-18T16:42:20+02:00
draft: false
weight: 32
---

# Upgrade cluster to latest

```
oc adm upgrade --to-latest
```

# Force the update to a specific version/hash

- Get the hash of the image version

```
CHANNEL='stable-4.16'
ARCH='amd64'
curl -sH 'Accept: application/json' "https://api.openshift.com/api/upgrades_info/v1/graph?channel=${CHANNEL}&arch=${ARCH}" | jq .
```

- Apply the update

```
oc adm upgrade --allow-explicit-upgrade --force=true --to-image=quay.io/openshift-release-dev/ocp-release@sha256:7e1e73c66702daa39223b3e6dd2cf5e15c057ef30c988256f55fae27448c3b01
```

# Verify the available upgrade versions

Kudos to [Ramon Gordillo](https://github.com/rgordill)

Depending on the OCP version you can upgrade to some specific versions.

For a specific version and architecture:

```
CHANNEL='stable-4.16'
ARCH='amd64'
VERSION='4.16.0'
curl -sH 'Accept:application/json' "https://api.openshift.com/api/upgrades_info/v1/graph?channel=${CHANNEL}&arch=${ARCH}" | jq --arg VERSION "${VERSION}" '. as $graph | $graph.nodes | map(.version == $VERSION) | index(true) as $orig | $graph.edges | map(select(.[0] == $orig)[1]) | map($graph.nodes[.])'
```

The output is a list of graph nodes that the selected version can upgrade to.

# Switch OpenShift Channel and trigger a refresh

For instance, switching from `stable-4.6` to `fast-4.6`:

```
oc patch clusterversion version --type="merge" -p '{"spec":{"channel":"fast-4.6"}}'
oc delete po -n openshift-cluster-version -l k8s-app=cluster-version-operator
```

Then you can update to latest as:

```
oc adm upgrade --to-latest
```
