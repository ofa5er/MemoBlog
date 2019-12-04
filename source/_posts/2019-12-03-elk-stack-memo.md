---
title: elk-stack-memo
comments: true
date: 2019-12-03 19:31:35
tags:
---

<!-- more -->


# Installtion
## Mac OS
https://logz.io/blog/installing-elk-on-macos/
```bash
brew install elastic/tap/elasticsearch-full
brew services start elastic/tap/elasticsearch-full
curl http://localhost:9200 #Verification
brew install elastic/tap/kibana-full
brew services start elastic/tap/kibana-full
## Access to http://localhost:5601
```
