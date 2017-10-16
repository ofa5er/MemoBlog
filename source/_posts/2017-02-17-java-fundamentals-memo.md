---
title: Java Fundamentals (Cheat sheet)
date: 2017-02-17 08:04:53
tags:
 - java
 - cheatsheet

comments: true
---
A CheatSheet for Java fundamentals
<!-- more -->

# String
```java
String str = "example"

str.charAt(1); // return x
str.equals("example2"); // if !equal return false else true.
str.compareTo("example2"); // if equal return 0, if less return > 0, if null raise an excpetion
str.replace("exam", "t"); // return "tple"
str.trim(); // remove spaces
str.toLowerCase();
str.lenght();
str.isEmpty();

str.substring(int being); O(n)
str.substring(int being, int end); O(n)

str.indexOf("ample");//Return index of first occurance, -1 if not found


String str = "/home//a/b/c"
String[] sr.split("/+");// [home, a, b, c]
//Sort String
char[] ar = str.toCharArray();
Arrays.sort(ar);
String sorted = String.valueOf(ar);


//StringBuilder
/* Avoid using str+="str"
   On each concatenation a new copy of string is created and 2 strings are copied to over character by character   
   O = O(n^2).
*/
String joinWords(String[] Words) {
  StringBuilder sb = new StringBuilder();
  for (String w : words) {
    sb.append(w);
  }
  return sb.toString();
}
```

```java
Integer.bitCount()
Random.nextBoolean(); //random boolean
```
# Enums
```java
public enum Color {
  BLACK, WHITE, RED, GREEN
}
```
# Conditions
```java
int x = 1;
switch (x) {
  case 1: System.out.println("1");
          break;
  case 2: System.out.println("1");
          break;
   default:
          System.out.println("0");
          break;
}
```

# Loops

```java
for (int i = 0; i < size; i++) {

}

while (true) {

}

```

# Class
public class NewClass {
 public NewClass() { 
 }
}
# Read/Write

```java
BufferedReader br = new BufferedReader("file.txt");
while ((thisLine = br.readLine()) != null) {
    System.out.println(thisLine);
}
```

```java
BufferedWriter bw = new BufferedWriter(new FileWriter("/tmp/a.txt"));
bw.write(text);
bw.close();
```

# Threads

2 possible ways to use threads in Java.
## Implement Runnable

- Class needs only to be runnable and doesn't need all the overhead of the Thread class

- Class needs to inherit from another class (multiple inheritance is not supported in java)

```java
class MyThread implements Runnable {
  public void run() {
    //Do stuff
    Thread.sleep(1000);
  }
}
public static void main(String[] args) {
  MyThread instance = new MyThread();
  Thread thread = new Thread(instance);
  thread.start()
}
```

## Extend Thread

```java
class MyThread extends Thread {
  public void run() {
    //Do stuff
    Thread.sleep(1000);
  }
}
public static void main(String[] args) {
  MyThread thread = new MyThread();
  thread.start()
}
```

## Synchronized Execution of code

### Synchronized

```java
public class MyObject {
  public synchronized void foo() {}
}

public class MyObject2 {
  public void foo() {
    synchronized(this) {
      //Do stuff
    }

  }
}
```

### Lock

```java
public class LockedATM {
  private Lock lock;
  
  public LockedATM() {
    lock = new ReentrantLock();
  }
  
  public int withdraw() {
    lock.lock();
    //code to protect
    lock.unlock();
    return 123;
  }
  
}
```

# Generics

```java
public class Node<T> {
  private Node next;
  private T item;
}
```