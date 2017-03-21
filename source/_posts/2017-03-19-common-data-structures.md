---
title: Common data structures
date: 2017-03-19 19:09:12
tags:
  - cheatsheet
  - data structure
comments: true
---
Common data structures implementation using java
<!-- more -->
# LinkedList

## Time Complexity
| Operation    | Time Complexity |
|--------------|-----------------|
| appendToTail  |          `O(n)` |

## Java Impelementation

```java
class Node<T> {
  Node next;
  T data;

  public Node(T d) {
    data = d;
  }

  public void appendToTail(T d) {
    Node end = new Node(d);
    Node n = this;
    while (n.next != null) {
      n = n.next;
    }
    n.next = end;
  }
}

```

# Stack
# Queue
# HashTable
# Binary Tree
# Graph
# Heap
