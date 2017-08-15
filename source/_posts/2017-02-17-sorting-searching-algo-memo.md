---
title: Common Sorting and Searching Algorithms Cheat Sheet
date: 2017-02-17 08:07:46
tags:
  - cheatsheet
  - algorithms
  - sorting
  - searching
comments: true
---
Common sorting and searching algorithm implemented in java
<!-- more -->
# Binary Search
## Recursive
```java
public boolean binarySearch(int[] array, int value, int low, int high) {
  if (high < low) return false;
  int mid = (low + high) / 2
  if ( value < a[mid] ) {
    return binarySearch(array, value, low, mid - 1);
  } else if ( value < a[mid] ) {
    return binarySearch(array, value, mid + 1, high);
  } else {
    return true;
  }
}
```
## Iterative
```java
public boolean binarySearch(int[] array, value) {
  int low = 0, high = array.length;

  while ( low <= high ) {
    mid = (high + low) / 2;
    if (value < a[mid]) {
      high = mid - 1;
    } else if (value > a[mid]) {
      low = mid + 1;
    } else {
      return true
    }
  }
  return false;
}
```
# Graphs

```java
class Node<T> {
  boolean visited;
  ArrayList<Node> children;
  T value;
  public Node(T val) {
    children = new ArrayList<Node>();
    value = val;
  }
}
class Graph<T> {
  ArrayList<Node<Integer>> nodes;
  public Graph(){
    nodes= new ArrayList<Node<Integer>>();
  }
}
```

## Depth-First Search (DFS)

```java
public boolean DFS(Node<Integer> root, int val) {
    if (root == null) return false;
    if (root.value == val) return true;
    root.visited = true;
    boolean result = false;
    for ( Node<Integer> child : root.children) {
      if ( !child.visited ) {
        result |= DFS(child, val);
      }
    }
    return result;
  }
}
```

## Breadth-First Search (BFS)

```java
public boolean BFS(Graph<Integer> g, int val) {
  LinkedList<Node<Integer>> queue = new LinkedList<Node<Integer>>();
  queue.add(g.nodes.get(0));
  while (!queue.isEmpty()) {
    Node<Integer> curNode = queue.remove();
    curNode.visited = true;
    for (Node<Integer> child : curNode.children) {
      if (child.value == val) {
        return true;
      }
      if (!child.visited) {
        queue.add(child);
      }
    }
  }
  return false;
}
```