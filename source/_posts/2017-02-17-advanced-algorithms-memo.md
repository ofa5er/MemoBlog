---
title: Random Algorithms Cheat Sheet
date: 2017-02-17 08:06:40
tags:
  - cheatsheet
  - algorithms
comments: true
---
A cheat sheet for some known algortihms

<!-- more -->
# Knuth–Morris–Pratt algorithm

Algortihm that retrun the position of string within another string:
- Naive algorithm : worst-case : O(n*k)
- KMP : worst-case O(n + k) (O(n) since k < n)

Algorithm explanation:
http://www.geeksforgeeks.org/searching-for-patterns-set-2-kmp-algorithm/

# Knuth Shuffle ((a.k.a. the Fisher-Yates shuffle)

```java
public Cards[] shuffle(Card[] cards) {
  for (int i = 0; i < cards.length; i ++) {
    int j = random(0, cards.length - 1);
    int temp = cards[j];
    cards[j] = cards[i];
    cards[i] = temp;
  }
}
```

# Djikstra's Algortihm

# A* Search Algorithm

# AVL Tree

# Red-Black Tree

# Topological sort

# Travelling Salesman Problem

# K-nearest neighbors algorithm (k-NN)

# Rabin-Karp Substring Search

# Knuth-Morris-Pratt

# Bellman-Ford Algorithm

# Floyd-Warshall Algorithm

# Minimum Spanning Tree

# B-Tree

# Interval Trees

# Graph coloring

# P, NP and NP-Complete

# Bipartite Graph

# Regular Expressions

# Floyd’s Cycle-Finding Algorithm