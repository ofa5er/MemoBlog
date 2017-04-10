---
title: Android Memo
comments: true
date: 2017-04-09 17:24:42
tags:
  - cheatsheet
  - android
---
Android memo
<!-- more -->
# General

## What are the different types of intents ?

  - **Explicit intent**: Used to start an activity within the same application.
  
  - **Action intent**: Implicit Intents do not directly specify the Android components which should be called, it only specifies actions to be performed.An Uri can be used with the implicit intent to specify data type.

## What are launch modes in Android ?

- Launch modes of android:
  - **standard (default)**: Multiple instances of the activity class can be instantiated and multiple instances can be added to the same task or different tasks.
  - **singleTop**: if an instance of the activity already exists at the top of the current task and the system routes the intent to this activity, no new instance will be created because it will fire off an onNewIntent() method instead of creating a new object.
  - **singleTask**: A new task will always be created and a new instance will be pushed to the task as the root. However, if any activity instance exists in any tasks, the system routes the intent to that activity instance through the onNewIntent() method call. In this mode, activity instances can be pushed to the same task. This mode is useful for activities that act as the entry points.
  - **singleInstance**: Same as singleTask, except that the no activities instance can be pushed into the same task of the singleInstance’s. Accordingly, the activity with launch mode is always in a single activity instance task. This is a very specialized mode and should only be used in applications that are implemented entirely as one activity.
 - **Defintion**:
 
    - **Manifest file**: When defining the new activity in the manifest file singleTop, singleTask, single instance,...
    - **Intent flags**: Calls to startActivity() can include a flag in the Intent that declares if and how the new acitivity should be associated with the current task
        - FLAG_ACTIVITY_NEW_TASK
        - FLAG_ACTIVITY_SIGNLE_TOP
        - FLAG_ACTIVITY_CLEAR_TOP

## How to pass data to another activity in Android ?

```java
Intent intent = new Intent(currentActivity.this, TargetActivity.class);
intent.putExtra("booktype", "favourate");
startActivity(intent);
```

## What is a Loader ?

Loaders provide a framework to perofrm asynchronous loading of data they are registred by ID with a component called the LoadManager, which allows them to live beyond the lifecycle of the activity preventing duplicate loads that happens in parallel. (e.g. AsyncTaskLoader)

## What is a contract ?

A contract is a class that defines the tables and the columns for each table that are included in the database
```java
public final class FeedReaderContract {
    // To prevent someone from accidentally instantiating the contract class,
    // make the constructor private.
    private FeedReaderContract() {}

    /* Inner class that defines the table contents */
    public static class FeedEntry implements BaseColumns {
        public static final String TABLE_NAME = "entry";
        public static final String COLUMN_NAME_TITLE = "title";
        public static final String COLUMN_NAME_SUBTITLE = "subtitle";
    }
}
```

## What is a DB Helper (SQLiteOpenHelper) ?
It exist mainly to take care of creating the database and upgrading it when the schema changes.
It has to method onCreate and OnUpgrade

## What are the 4 key component in the Android Framework ?

- Activity
- Service
- Content Provider
- Broadcast receiver

## What is a content provider ?
It is a class that sits between an application and its data source. Its job is to provide easily managed access to the underlying data source.

## What are the advantages of content providers ?
- **Abstraction layer**: Possibilty to change the underlying database without the need to change any code in the application that access the content provider.
- Leverage functionality of Andrdoid classes (e.g. Loaders).
- Allow many apps to access, use and modify a single data source securely.

## How to create a Content Provider ?
1. Create a class that extends from the content provider and implement the onCreate() function.
2. Register your content provider in the Manifest.
3. Define URI's that identify the Task Content Provider and the different data types that it can return.
4. Add these URI's to the Contract Class.
5. Build a URIMatcher to match URI patterns to integers.
6. In the task content provider class, Impelement the required CRUD methods like query, insert and delete.



## What is a Content Resolver ?
It sits between the content provider and the external application. Content Resolver acts as an internidiary between each app and the content provider, or providers, it wants to access. It handles inter-process communication an keeps everything in sync and running smoothly.



## What is a service ?

Services are Android Framework Components meant for running background tasks that don't need a visual component. An activity start a service and the service will keep running even after the destruction of the activity. They are great for processing and loading data in the background.

## What is an IntentService ?
It is a service that run in a background thread all together.


## Services vs Loaders ?

Use Loaders when:
- Tied to the Activity Lifecycle
- Easy to make user interface changes and communicate with Activity
Use Services:
- The task that you are doing is decoupled from the user interface.
- Exists even when there is no user interface.


## What is a Pending Intent ?
Any notification is managed by a system service called NotificationManager. It is not part of your application so it can't execute things related to your application (e.g. open acitvity..). A PendingIntent resolve this issue.

A PendingIntent is a wrapper around a regular intent that is designed to be used by another application.

## What is a foreground Service ?
A foregound service is a service that the user is actively aware of because Android requires that service post a non-dismissible ongoing notification. They are typically used to show the user the real-time progres of a long-running operation. (e.g. Music player, google maps navigation)

## What is an adapter ?
An Adapter object acts as a bridge between an AdapterView and the underlying data for that view. The Adapter provides access to the data items. The Adapter is also responsible for making a View for each item in the data set.

## What is the UI thread ?
It has a message queue and a handler that allows you to send an process runnable objects and messages, often from other threads.

## How the recyclerView works ?

## What is an AsyncTask ?
Allows you to run a task on the background thread while publishing results to the UI thread.
