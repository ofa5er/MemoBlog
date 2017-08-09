---
title: virtualbox-memo
comments: true
date: 2017-08-05 13:10:08
tags:
  - cheatsheet
  - virtualbox
---

<!-- more -->

# Installation

## Ubuntu 16.04

```bash
sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - 

sudo apt-get update 

sudo apt-get install virtualbox-5.1

```