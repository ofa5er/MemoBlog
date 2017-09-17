---
title: Java Data Structures Cheat Sheet
date: 2017-02-17 08:08:51
tags:
 - java
 - cheatsheet
 - data structure
comments: true
---
A CheatSheet for basic Java APIs
<!-- more -->

# BitSet

```java
java.util.BitSet

BitSet b1 = new BitSet(16);
BitSet b2 = new BitSet(16);
BitSet bits1 = BitSet.valueOf(55);

b1.or(b2);
b1.and(b2);
b1.size();
b1.set(2,true); // change bit index 2 to 1;
b1.cardinality( ); // return the number of 1
b1.flip(5); // flip bit 5;
b1.flip(0, b1.size() - 1); //flip all

int mask = (Integer.highestOneBit(num) << 1) - 1;

```

# ArrayList / Vector

```java
int iArr[] = {2, 1, 9, 6, 4};
// sorting array
Arrays.sort(iArr);
```

# Interface List

## ArrayList

```java
ArrayList<Integer> array = new ArrayList<Integer>();
array.add(10);
array.add(index, 12);
array.remove(12);
array.remove(index);
array.toArray();
array.indexOf(10);
array.contains(10);
array.get(index);

```

## LinkedList

```java
LinkedList<Integer> ll = new LinkedList<Integer>(); 
ll.add(122); //add at the end    - Queue
ll.remove(); // remove from first  - Queue
ll.removeLast();
ll.get(index);
ll.getFirst();
ll.getLast();
ll.pop(); //removes and returns first element - Stack
ll.push(11); //add at the front - Stack
ll.sort((a, b) -> a.compareTo(b));

```

# Interface Set

## HashSet

```java
import java.util.HashSet;

HashSet<String> hset = new HashSet<String>()
hset.add("Test");
hset.contains("Test"); // return True
//Iterate
for (String s : hset) {
    System.out.println(s);
}

//Java 8 only, forEach and Lambda
hset.forEach(System.out::println);

hset.remove("Test");
hset.clear();
hset.isEmpty(); //return true
hset.size(); //return size

```


## LinkedHashSet

```java

//TODO

```


## TreeSet

```java
TreeSet<Integer> tset = new TreeSet<Integer>();

// Adding elements to TreeSet<String>
tset.add(1);
tset.add(3);
tset.add(5);
tset.add(4);
tset.add(2);
tset.contains(1); //true
Iterator<Integer> itr=tset.iterator();
while(itr.hasNext()){
    System.out.println(itr.next());
}

//Displaying TreeSet
System.out.println(tset); //[1, 2, 3, 4, 5]

```

## EnumSet

```java
//TODO
```

# Queue

## PriorityQueue

```java
PriorityQueue<String> queue =new PriorityQueue<String>();
queue.add (10);
queue.add (12);
queue.add (1);
queue.add (8);
while (!pq.isEmpty()) {
    System.out.println(pq.poll()); // 1, 8, 10, 12
}


public class Test
{
    public static void main(String[] args)
    {
        Comparator<String> comparator = new StringLengthComparator();
        PriorityQueue<String> queue = 
            new PriorityQueue<String>(10, comparator);
        queue.add("short");
        queue.add("very long");
        queue.add("medium");
        while (queue.size() != 0)
        {
            System.out.println(queue.remove()); // Short, Medium, Very long
        }
    }
}
// StringLengthComparator.java
import java.util.Comparator;
public class StringLengthComparator implements Comparator<String>
{
    @Override
    public int compare(String x, String y)
    {
        if (x.length() < y.length())
        {
            return -1;
        }
        if (x.length() > y.length())
        {
            return 1;
        }
        return 0;
    }
}
```

## LinkedList

```java
```

## ArrayDeque

```java
```

# Map

## HashMap (HashTable)

```java
import java.util.HashMap;

HashMap<Integer, String> hmap = new HashMap<Integer, String>()
hmap.put(12, "Test");
hmap.get(12); // return "Test"

//Iterate
hmap.containsKey(12); // return True
for(Entry<Integer, String> e : hmap.entrySet()) {
     String key = e.getKey();
     String value = e.getValue();
}
//Java 8 only, forEach and Lambda
hmap.forEach((k,v)->System.out.println("Key : " + k + " Value : " + v));

for (String key : map.keySet()) {
    // only Keys
}
for (String value : map.values()) {
    // only Values
}

hmap.remove(12);
hmap.clear();
hmap.isEmpty(); //return true
hmap.size(); //return size

```

## TreeMap

Implementation of red black tree:
 - A self balancing binary search tree

```java

```

# List implementations:

|                 |    get  |  add  | contains | next | remove(0) | iterator.remove|
|-----------------|---------|-------|-----     |------|-----------|-------------------------|
|ArrayList        |     O(1) | O(1) | O(n)     | O(1) | O(n)      |    O(n)                 |
|LinkedList       |     O(n) | O(1) | O(n)     |  O(1)| O(1)      |    O(1)                 |
|CopyOnWrite-ArrayList| O(1) | O(n) | O(n)     |  O(1)| O(n)      |   O(n)                  |

Set implementations:

|                      add  |    contains | next    |   notes                 |
|-----------------|---------|-------------|---------|-------------------------|
|HashSet          |     O(1) |    O(1)     |O(h/n)  | h is the table capacity |
|LinkedHashSet    |     O(1) |   O(1)      |O(1)    |                         | 
|TreeSet          | O(log n) |O(log n)     |O(log n)|                         |

Map implementations:

|                 |get      |  containsKey| next    | Notes                   |
|-----------------|---------|-------------|---------|-------------------------|
|HashMap          | O(1)    | O(1)        |O(h/n)   |h is the table capacity  |
|LinkedHashMap    | O(1)    | O(1)        |O(1)     |                         |
|TreeMap          | O(log n)| O(log n)    |O(log n) |                         |

Queue implementations:

|                 |  offer  |  peek       | poll    |   size                  |
|-----------------|---------|-------------|---------|-------------------------|
|PriorityQueue    |     O(log n)| O(1)| O(log n)    | O(1)                    |
|LinkedList       |     O(1)    | O(1)| O(1)        |     O(1)                |
