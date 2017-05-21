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
  
  - **Implicit intent**: Implicit Intents do not directly specify the Android components which should be called, it only specifies actions to be performed.An Uri can be used with the implicit intent to specify data type.

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

## How to passs the data to sub-activities in Android ?

## How to start a new activity ?

```java
Intent i = new Intent(getApplicationContext(), ActivityTwo.class);  
startActivity(i);  
```

## What is a content resolver ?
The content resolver acts as intermediary between each app and the content provider or providersm it wants to access. It handles inter-process communication and keeps everything in sync and running smoothly.
It has 4 methods:
- Create
- Read
- Update
- Delete

## What is a fragement ?
A class that represents a modular and reusable piece of activity

## What are the different lifecycles whne the deivice is rotated ?
onPause, onSaveInstanceState, onStop, onDestroy, onCreate, onStart, onResume

## What is the Adapter responsible for ?

## What is you favroite tool or library in Android ? Why is it so useful ?

## You want to open a map app from an app that you’re building. The address, city, state, and ZIP code are provided by the user. What steps are involved in sending that data to a map app?

## List and explain the differences between four different options you have for saving data while making an Android app. Pick one, and explain (without code) how you would implement it.

## What are your thoughts about Fragments? Do you like or hate them? Why?

## What is the UI thread ?

## What is an AsyncTask ?

## I have an application and I need to be able to share data with other applications, How can I initially approach this ?
If the data is unique to your app, I would use a content provider that interacts with some sort of data persistence on the backend (SQLLite, Shared Preferences). If you have a content provider that become accessible from other apps on your Android device using a URI. So you could call a content resolver to find where that URI come from and communciate with the content provider to manipulate the database. Either pull data or perhaps push data or update data.
### What is a good example where a content provider would make sense ?
A good example would be what comes already in Android wich is your contact list. So let's say that you would like to add a contact from some new way for example a website or a picture for example you take a pciture and you build the contact information from it. So using the contact resolver you access the address book and you push that contact into your contacts.
### A problem that usually confuses new Android developers is for example if I have a progressBar and when I rotate the phone I loose that. Could examplain to me in detail why that is occuring ?
This has to do with one of the fundamental concepts of Android development and the Android operating system which is the activity lifecycle or the fragment lifecycle as well. So when you create a fragment it's attached to your acitvity. When you rotate a device your activity is destroyed your fragment will be destroyed. So, if you don't have any sort of check to see if your activity has bee running. the activity will start again as if it was never runnining. So any data that changed during the lifecycle of the application will then start as new. The way around this is to in your oncreate method you check for a parameter called savedInstanceState. so, if savedInstancestate is not equal to null this means that your activity was running before it got to this point. There we can reference some data that we wanted to save and we can have it translate over the rotation with a new activity.
### Suppose in this application maybe a game I have more than a simple primitive. I have more complex data so how can I pass it to the savedInstanceState ?
There several way for example we could use a parcelable to send the complex data to the bundle. It is also possible to use some sort of persistance that supports complex objects like database. So, we check the savedInstanceState if it is not null we load again the data from the database. 

We can also use Serlized class but it is much more slower that parcelable. So it is better to use Parcelable.

## I finished developing this great application and what I notice that every now and then I get an ANR (application not responsive) and I have no idea what is happening ?
There a lot of reasons for this to happen but mostly is caused by the fact of running a time consuming operation on the UI thread. Android Apps typically run on on threa and that is your UI thread. If you don't declare anything else, if you just running all your methods from on create or something like that oe calling methods from there. It's just running on one thread. and If you're running a really intensive process or maybe making a network call, if you don't get a different error you could get an ANR because you are overloading the UI thread.

### So let's say that this application has a background service that runs a network call every 5 minutes. I still can't figure out why i am getting an ANR ?
If you are running it from a normal service (not an intent service). It is normal to get ANR because network calls are time consuming and the service runs a UI thread this will cause definetly an ANR. To fix this you should move the network calls to an intentservice.

## My application has list view in it and I noticed that as I started scrolling things start to not running in a smooth way. I noticed that I'am scrolling along and like it's just taking a while or it gets stuck. What are some things that I could do to start to debug those issues, what are some possible causes for that ?
One possibe issue might be is that your data is not loading fast enough to your listView.
## Let's suppost that I have all the data in memory ?
One possible is that you are loading some complex data let's say big images that are not loaded fast enough. Another possible thing is that your views are not just getting resued fast enough. You can't load everything at once you need to load one item above and one item below and all the items in the screen and then reuse those. It is a common pattern that is used on a list view that has the name of RecyclerView. In list view before it wasn't enforced by system so you have to implement that by yourself.