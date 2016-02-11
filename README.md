# Todo List: Additional Features 
 

## Summary 
This challenge is a continuation of a [command line todo list challenge][].  We'll take an application that meets all the requirements specified in that challenge and add some additional features.  Write the best object-oriented code we can!


## Releases
### Pre-release: Review the Code Base
We're provided with a working todo list application, based on the requirements of the [command line todo list challenge][].  We can use the application to display a list of items, add items, remove items, and mark items as complete.  Run the tests and review the code.  What objects are there?  How do they work together?  Be sure to understand how the provided application works because we're going to dive into it when it's time to add new features.


###Release 0 : Add Features

####Implement the list:outstanding command

Implement a command that works like

```text
$ ruby todo.rb list:outstanding
```

This should display a list of outstanding tasks sorted by *creation date*.

*User Experience Alert*: They say that defaults matter.  What do you think the default sort direction should be and why?  Newest tasks first or oldest tasks first?  Would your answer change if a user had a really long TODO list?

#### Implement the list:completed command

Implement a command that works like

```text
$ ruby todo.rb list:completed
```

This should display a list of completed tasks sorted by *completion date*.  The same **user experience** considerations apply here, too.

#### Implement the tag command

Implement a command that works like

```text
$ ruby todo.rb list
1. Eat some pie
2. Walk the dog

$ ruby todo.rb tag 2 personal pet-care
Tagging task "Walk the dog" with tags: personal, pet-care
```

Each task can have multiple tags, so you'll have to change your file format to accommodate that.  

If you implemented the extra credit feature from part 1 about the `todo.txt` file being human-readable, try to keep that constraint: you should be able to print out `todo.txt`, hand it to someone who doesn't have experience using computers, and have them recognize it as a TODO list.

###Release 1 : Implement the filter command

Implement a `filter` command that works like

```text
$ ruby todo.rb list
1. Eat some pie
2. Walk the dog

$ ruby todo.rb tag 2 personal pet-care
Tagging task "Walk the dog" with tags: personal, pet-care

$ ruby todo.rb filter:personal
2. Walk the dog [personal]
```

This should display a list of all tasks with the *personal* tag sorted by *creation date*.


<!-- ##Optimize Your Learning  -->

##Resources


[command line todo list challenge]: ../../../ruby-todos-1-0-core-features-challenge