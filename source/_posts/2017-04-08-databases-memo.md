---
title: databases-memo
comments: true
date: 2017-04-08 08:00:08
tags:
  - cheatsheet
  - database
  - sql
---

A memo about databases

<!-- more -->
# SQL Syntax and variations

## Explicit Join

```sql
SELECT CourseName, TeacherName
FROM Courses INNER JOIN Teachers
ON Courses.TeacherID = Teachers.TeacherID
```

## Implicit Join

```sql
SELECT CourseName, TeacherName
FROM Courses, Teachers
WHERE Courses.TeacherID = Teachers.TeacherID
```

# Denormalized vs Normalized

## Normalized database

Courses contains a column TeachID, which is a foreign key to teacher.

- Minimize reduncancy (+).
- Many common queries require expensive joins (-).

## Denormalized database

If we know that we have to repeat this quey often we might store the teacher's name in the Courses table.

- Optimise read time.
- It is commonly used to create highly scalable systems.

# SQL Statements





![](http://files.zeroturnaround.com/pdf/zt_sql_cheat_sheet.pdf) 
