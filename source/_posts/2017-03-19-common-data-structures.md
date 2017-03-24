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
| appendToTail |          `O(n)` |

## Java Implementation

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

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
| pop()              |       O(1)          |
| push()             |       O(1)          |
| peek()             |       O(1)          |
| isEmpty()          |       O(1)          |
## Java Implementation
### LinkedList Based
```java
class Stack<T> {
  private static class StackNode<T> {
    private T data;
    private StackNode<T> next;
    public StackNode(T d) {
      data = t;
    }
  }
  StackNode<T> top;
  public T pop() {
      if (top == null) throw new EmptyStackException();
      T item;
      item = top.data;
      top = top.next;
      return item;
  }

  public void push(T d) {
    StackNode<T> item = new StackNode(d);
    item.next = top;
    top = item;
  }

  public T peek() {
      if (top == null) throw new EmptyStackException();
      return top.data; 
  }

  public boolean isEmpty() {
    return top == null;
  }
}
```
### Array Based
```java
class Stack<T> {
  private static int SIZE = 4;
  T[] array;
  int index = 0;

  public Stack() {
    array = (T[]) new Object[SIZE]
  }

  public void push(T d) {
    if (index == array.length) resize(2 * array.length);
    top[topIndex++] = d;
  }

  private void resize(int capacity) {
    T[] resizedArray = (T[]) new Object[capacity];
    for (int i = 0; i < array.length; i++) {
      resizedArray[i] = array[i];
    }
    array = resizedArray;
  }

  public T pop(T d) {
    if (topIndex == -1) throw new EmptyStackException();
    T item = top[topIndex];
    top[topIndex--] == null;
    if (topIndex > -1 && topIndex == top.length / 4)
    return item;
  }

  public T peek() {
    if (topIndex == -1) throw new EmptyStackException();
    return top[topIndex];
  }

}
```
# Queue

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
| add()              |       O(1)          |
| remove()           |       O(1)          |
| peek()             |       O(1)          |
| isEmpty()          |       O(1)          |

## Java Implementation

### LinkedList Based
```java
class Queue<T> {
  private static class QueueNode<T> {
    T data;
    QueueNode<T> next;
    public QueueNode(T d) {
      data = d;
    }
    private QueueNode<T> first;
    private QueueNode<T> last;
    public void add(T d) {
      QueueNode item = new QueueNode<T>(d);
      if (last != null) {
        last.next = item;
      }
      last = item;
      if (first == null) {
        first = last;
      }
    }

    public T remove() {
      if (first == null) throw new EmptyStackException();
      T data = first.data;
      first = first.next;
      if (first == null) {
        last = null;
      }
      return data;
    }

    public T peek() {
      if (first == null) throw new EmptyStackException();
      return first.data;
    }

    public boolean isEmpty() {
        return first == null;
    }
  }

}
```

### Array Based

```java
class Queue<T> {
  int INITIAL_SIZE = 2;
  int tail, head, total;
  T[] array;

  public Queue() {
    array = (T[]) new Object[INITIAL_SIZE];
  }

  public void add(T d) {
    if (total == array.length)  resize(2 * array.length);
    array[tail++] = d;
    if (tail == array.length) tail = 0;
    tail = 0;
  }

  public T remove() {
    if (total == 0) throw new EmptyQueueException();
    T item = array[head];
    array[head++] = null;
    if (head == array.length) head = 0;
    if (--total > 0 && total < array.length / 4) {
      resize(array.length / 4);
    }
    return item;
  }

  public void resize(int capacity) {
    T[] tmp = (T[]) new Object[capacity];
    for (int i = 0; i < total; i++) {
      tmp[i] = array[ (first + i) % array.length];
    }
    array = tmp;
  }

}
```
# HashTable

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|   |          |
## Java Implementation

# Binary Tree

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|   |          |
## Java Implementation

# Graph

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|   |          |
## Java Implementation

# Heap

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|   |          |
## Java Implementation

# Doubly LinkedList

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|   |          |
## Java Implementation