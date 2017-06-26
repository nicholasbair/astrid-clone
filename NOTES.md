# Notes

## General Idea
Do you remember Astrid?  Such a great mobile task manager (Yahoo bought it and shut it down).
I'd like to build a rails app to capture many of the features I liked.
- Shared tasks
- Assign entire list to someone
- Assign individual tasks in a list to someone

## Data structure
Users
  - have many lists
  - have many tasks through lists
Lists
  - belong to user
  - have many tasks
Tasks
  - belong to list

Users need to have many assigned tasks, and tasks should be assigned to a user
Defaults to user who created

Users need to be able to be associated to each other, e.g. I shouldn't be able to assign a task to any user.

Permissions:
  If I create a task, and assign it to a friend.  The only thing my friend should be able to do is accept, comment, and mark complete

## User stories
...

## Crazy and Random Ideas
- View as Kanban -> list level and task level
- Use Google Maps api for something, because Google
- Voice to text
- Some form of comments, like waffle.io
- Graphs => completed vs pending
- Astrid had funny messages whenever you completed a task
- Snooze until like in gmail
