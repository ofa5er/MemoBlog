---
title: bit-manipulation
comments: true
date: 2017-10-08 14:15:00
tags:
---

<!-- more -->

# Bits counting algorithm (Brian Kernighan)

```java
int numberOf1Bits(int n) {
  int res = 0;
  while (n != 0) {
    n &= (n - 1);
    res++;
  }
  return res;
}
```

