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

## User stories
...

## Routes
index - marketing, link to signup/signin
Logged in index should show all assigned and owned tasks that are assigned to others, organized by list
Drill into each list '/lists/1' or maybe '/users/1/lists/2'

## Authentication
Index should be only unprotected route

## Permissions
User can CRUD lists and tasks
Assigned user can mark task as complete and comment, but nothing else if he/she is not creator of task

## Crazy and Random Ideas
- View as Kanban -> list level and task level
- Use Google Maps api for something, because Google
- Voice to text
- Some form of comments, like waffle.io
- Graphs => completed vs pending
- Astrid had funny messages whenever you completed a task
- Snooze until like in gmail
