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

# Generics
public class Node<T> {
  private Node next;
  private T item;
}

