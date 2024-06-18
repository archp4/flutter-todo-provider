import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends ChangeNotifier {
  // List of todos
  final List<Todo> _todos = [
    Todo(title: "First Todo", isDone: true),
  ];

  // sending todo when user request it
  List<Todo> get todos => _todos;

  // Adding New Todos
  void addTodo({required Todo todo}) {
    _todos.add(todo);
    notifyListeners();
  }

  // Chaning Todo State done or not
  void todoDone({required int index}) {
    todos[index].taskDone();
    notifyListeners();
  }

  // Removing Todo
  void todoRemove({required Todo todo}) {
    _todos.remove(todo);
    notifyListeners();
  }
}
