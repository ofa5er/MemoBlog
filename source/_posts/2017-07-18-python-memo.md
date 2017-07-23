---
title: python
comments: true
date: 2017-07-18 23:59:12
tags:
  - cheatsheet
  - python
---

<!-- more -->
# Installation

## Ubuntu 16.04

```bash
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev
```

# Setting Up a Virtual Environment

```bash
sudo apt-get install -y python3-venv
mkdir environments
cd environments
pyvenv my_env
source my_env/bin/activate
```
