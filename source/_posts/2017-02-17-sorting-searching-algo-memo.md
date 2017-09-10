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
# Bubble Sort
| Quicksort                 |     Complexity     |
|---------------------------|--------------------|
| Worst-case performance    |      `O(n^2)`      |
| Best-case performance     |      `O(n)`        |
| Average-case performance  |      `O(n^2)`      |
| Worst-case space          |      `O(1)`        |

![](https://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif)

- **Quick Description** : Swap pairs of items.
- Advantages:
  - 
- Drawbacks:
  - 

# Implementation

```java
public void bubbleSort(int a[]) {
  for (int i = a.length; i > 0; i--) {
    for (int j = 0; j < i - 1; j++) {
      if (a[j] > a[j+1]) {
        int tmp = a[j];
        a[j] = a[j+1];
        a[j + 1] = tmp;
      }
    }
  }
}
```

# Selection Sort

| Quicksort                 |     Complexity     |
|---------------------------|--------------------|
| Worst-case performance    |      `O(n^2)`      |
| Best-case performance     |      `O(n)` comparisons, O(1)      |
| Average-case performance  |      `O(n^2)`      |
| Worst-case space          |      `O(n)`        |

![](https://upload.wikimedia.org/wikipedia/commons/9/94/Selection-Sort-Animation.gif)

- **Quick Description** : Find the Min and place it at the beginning.
- Advantages:
  - 
- Drawbacks:
  - 

# Implementation

```java
  public void SelectionSort(int[] a) {
    for (int i = 0; i < a.length ; i++) {
      int tmp = a[i];
      int minIdx = findMinIndex(a, i);
      a[i] = a[minIdx];
      a[minIdx] = tmp;
    }
  }
  private int findMinIndex(int a[], int startIndex) {
    int minIdx = startIndex;

    for (int i = startIndex + 1; i < a.length; i++) {
      if ( a[minIdx] >= a[i] ) {
        minIdx = i;
      }
    }
    return minIdx;
  }
```


# Merge Sort

- **Quick Description** : Divides the array in half, sorts each of those halves, and then merges them back together. The merge method operates by copying all the elements from the target array segment into a helper array.

- Advantages:
  - 
- Drawbacks:
  - 


![](https://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif)
| Quicksort                 |     Complexity     |
|---------------------------|--------------------|
| Worst-case performance    |      `O(n log n)`      |
| Best-case performance     |      `O(n log n)` |
| Average-case performance  |      `O(n)`  |
| Worst-case space          |      `O(n)`        |

# Implementation

```java
  public static void mergeSort(int[] array) {
    int[] helper = new int[array.length];
    mergesort(array, helper, 0, array.length - 1);
  }

  private static void mergesort(int [] array, int[] helper, int low, int high) {
    if (low < high) {
      int mid = (low + high)/2;
      mergesort(array, helper, low, mid); //Sort left half
      mergesort(array, helper, mid+1, high); //Sort second half
      merge(array, helper, low, mid, high); //Merge them
    }
  }

  private static void merge(int[] array, int[] helper, int low, int mid, int high) {
    // Copy both halves into a helper array
    for (int i = low; i <= high; i++) {
      helper[i] = array[i];
    }

    int helperLeft = low;
    int helperRight = mid + 1;
    int current = low;

    /* Iterate though helper array. Compare the left and the right half, copying back 
     * the smaller element from the two halves into the original array. */

    while (helperLeft <= mid && helperRight <= high) {
      if (helper[helperLeft] <= helper[helperRight]) {
        array[current] = helper[helperLeft];
        helperLeft++;
      } else {
        array[current] = helper[helperRight];
        helperRight++;
      }
      current++;
    }

    // Copy the rest of the left sie of the array into the target array
    int remaining = mid - helperLeft;
    for (int i = 0; i <= remaining; i++) {
      array[current + i] = helper[helperLeft + i];
    }
  }

```


# Quicksort

![](https://www.tutorialspoint.com/data_structures_algorithms/images/quick_sort_partition_animation.gif)


| Quicksort                 |     Complexity     |
|---------------------------|--------------------|
| Worst-case performance    |      `O(n^2)`      |
| Best-case performance     |      `O(n log n )` |
| Average-case performance  |      `O(n log n)`  |
| Worst-case space          |      `O(n)`        |


## Implementation

```java
public void quickSort(int[] a) {
  quickSort(a, 0, a.length);
}

private void quickSort(int[] a; int left, int right) {
  if (left >= right) {
    return;
  }
  int pivot = a[(left + right) / 2];
  int index = partition(a, left, right, pivot)
  quickSort(a, left, index);
  quickSort(a, index + 1, right);
}

private void partition(int a[], int left, int right, int pivot) {
  while (left < right) {
    while (a[left] < pivot) {
      left++;
    }
    while (a[right] > pivot) {
      right--;
    }
    if ( left <= right ) {
      swap(a, left, right);
      left++;
      right--;
    }
  }
  return left;
}

private void swap(int a[], int left, int right) {
  int tmp = a[left];
  a[left] = a[right];
  a[right] = tmp;
}
```

# Bubble sort
| Quicksort                 |     Complexity     |
|---------------------------|--------------------|
| Worst-case performance    |      `O()`      |
| Best-case performance     |      `O()` |
| Average-case performance  |      `O()`  |
| Worst-case space          |      `O()`        |
# Shellsort
| Quicksort                 |     Complexity     |
|---------------------------|--------------------|
| Worst-case performance    |      `O()`      |
| Best-case performance     |      `O()` |
| Average-case performance  |      `O()`  |
| Worst-case space          |      `O()`        |
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
# Heapsort

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