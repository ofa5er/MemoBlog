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

# Vector

## Java Implementation

```java
class Vector<T> {
  private T[] array;
  private int size;
  @SuppressWarnings("unchecked")
  public Vector() {
    array = (T[]) new Object[2];
  }
  public void add(T val) {
    if (size >= array.length) {
      resizeArray(size * 2);
    }
    array[size++] = val;
  }
  public void addAt(T value,int index) throws OutOfRangeException {
    if (index >= size) {
      throw new OutOfRangeException();
    }

    if (size == array.length) {
      resizeArray(size * 2);
    }
  }
  private void resizeArray(int newSize) {
    @SuppressWarnings("unchecked")
    T[] newArr = (T[]) new Object[newSize];
    for (int i = 0; i < size; i++) {
      newArr[i] = array[i];
    }
    array = newArr;
  }
  public T at(int index) throws EmptyStackException {
    if (index >= size) {
      throw new EmptyStackException();
    }
    return array[index];
  }
  public void remove() {
    size--;
    if (size < array.length/4) {
      resizeArray(array.length / 2);
    }
  }
  public T pop() {
    T result = array[size - 1];
    remove();
    return result;
  }
  public boolean find(T val) {
    for (int i = 0; i < size; i++) {
      if (array[i] == val) {
        return true;
      }
    }
    return false;
  }
  public boolean isEmpty() {
    return size == 0;
  }

  public int getSize() {
    return size;
  }
  public String toString() {
    if (size == 0) {
      return "Vector is empty";
    }
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < size; i++) {
      sb.append(array[i].toString());
      sb.append(",");
    }
    return sb.toString();
  }
}
```

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

## Definitions

- **Binary Search Tree**: All left descendants <= n < all right descendants

- **Balanced Tree**: Not terribly unbalanced tree. It is balanced enough to ensure that insert and find are O(logn).

- **Complete Binary Tree**: Every level is fully filled except the last.

- **Full Binary Tree**: Every Node has node has 0 or 2 children.

- **Perfect Binary Tree**: Full and Compete.


## Time Complexity

| Operation (Binary Search Tree)    | Time Complexity |
|--------------|-----------------|
|              |                 |
## Java Implementation
### Defintion
```java
class TreeNode<T> {
  TreeNode leftChild;
  TreeNode rightChild;
  T data;
}
```
### Traversal
#### Pre-order traversal
![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Sorted_binary_tree_preorder.svg/220px-Sorted_binary_tree_preorder.svg.png)
Pre-order: F, B, A, D, C, E, G, I, H.
```java
public preOrderTraversal(TreeNode root) {
  System.out.println(root.data);
  preOrderTraversal(root.leftChild);
  preOrderTraversal(root.rightChild);
}
```
#### In-order traversal
![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Sorted_binary_tree_inorder.svg/220px-Sorted_binary_tree_inorder.svg.png) In-order: A, B, C, D, E, F, G, H, I.
```java
public inOrderTraversal(TreeNode root) {
  inOrderTraversal(root.leftChild);
  System.out.println(root.data);
  inOrderTraversal(root.rightChild);
}
```
#### Post-order traversal
![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Sorted_binary_tree_postorder.svg/220px-Sorted_binary_tree_postorder.svg.png) Post-order: A, C, E, D, B, H, I, G, F.
```java
public postOrderTraversal(TreeNode root) {
  postOrderTraversal(root.leftChild);
  postOrderTraversal(root.rightChild);
  System.out.println(root.data);
}
```
# Graph

## Time Complexity

| Operation    | Time Complexity (Worst Case) |Space comlpexity (Worst Case)  |
|--------------|------------------------------|-------------------------------|
|  DFS         |  O(\|V\| + O(\|E\|)) = O(b^d)|  O(\|V\|) = O(b^d)            |
|  BFS         |                              |              |
## Representation (Adjacency list)

```java
class GraphNode<T> {
  T data;
  T[] neighbors;
  boolean visited;
}
class Graph {
  GraphNode[] nodes;
}
```

## Search

### Depth-First Search (DFS)

- **Preferred to visit every node in the graph. (Simpler than BFS)**
- Pre-order and other tree traversals are DFS algorithms.

![](http://s29.postimg.org/ig2mj533r/Depth_FS.gif)

#### Implementation in Java

##### Recursive (most common)

```java
void Search (Node root) {
  if (root == null) return;
  visit(root);
  root.visited = true;
  for (n : root.neighbors) {
    if (!n.visited) {
      search(n);
    }
  }
}
```

### Breadth-First Search (BFS)

- **Preferred to find the shortest path.**

![](http://algorithms.tutorialhorizon.com/files/2015/05/Graph-BFS.gif)
![](http://s29.postimg.org/qytzn2m7r/Breadth_FS.gif)

#### Implementation in Java

##### Iterative

```java
void search(Node root) {
  Queue<Node> queue = new LinkedList<>();
  root.marked = true;
  queue.offer(root);

  while (!queue.isEmpty()) {
    Node r = queue.poll();
    visit (r);
    for (n : r.neighbors) {
      if (!n.marked) {
        queue.offer(n);
      }
    }
  }
}
```

# Heap

## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|              |                 |

## Java Implementation

# Doubly LinkedList

![](http://www.tech-faq.com/wp-content/uploads/doubly-linked-list_clip_image002.jpg)
## Time Complexity

| Operation    | Time Complexity |
|--------------|-----------------|
|   |          |
## Java Implementation

```java
class Node<T> {
  T data;
  Node prev;
  Node next;
  public Node(T d) {
    data = d;
  }
}
class DoublyLinkedList<T> {
  Node head;
  Node tail;
  int size;

  public DoublyLinkedList(T data) {
    tail = new Node(data);
    head = tail;
    sie = 1;
  }

  public void addtoHead(T data) {
    Node n = new Node(data);
    if (size == 0) {
      head = n;
      tail = n;
    } else {
      head.prev = n;
      n.next = head;
      head = n;
    }
  }

  public void addtoTail(T data) {
    Node n = new Node(data);
    if (size == 0) {
      head = n;
      tail = n;
    } else {
      head.prev = n;
      n.next = head;
      head = n;
    }
  }

  public T removeFromHead() {
    if (size == 0) {
      throw new EmptyException()
    }
    T result = head.data;
    head = head.next;
    head.prev = null;
    return result;
  }
  public T removeFromTail() {
    if (size == 0) {
      throw new EmptyException()
    }
    T result = tail.data;
    tail = tail.prev;
    tail.next = null
    return result;
  }

  public int size() {
    return size;
  }
}
```