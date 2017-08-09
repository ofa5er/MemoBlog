---
title: Kubernetes-memo
comments: true
date: 2017-08-05 13:14:18
tags:
---

<!-- more -->

# Installation

## Ubuntu 16.04

1. Install virtualbox

2. Install kubectl

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

```

3. Install minikube

```bash
https://github.com/kubernetes/minikube/releases
```