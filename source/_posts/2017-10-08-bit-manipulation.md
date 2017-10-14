---
title: Bit Manipulation
comments: true
date: 2017-10-08 14:15:00
tags:
 - bit
 - cheatsheet
---
Bit Manipulation cheat sheet
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

# Common Bit Tasks: Getting and Setting

## Get Bit

```java
boolean getBit(int num, int i) {
  return (((num & (1 << i))) != 0);
}
```