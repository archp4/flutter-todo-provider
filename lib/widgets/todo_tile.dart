import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_notifier.dart';

ListTile todoTile({
  required Todo todo,
  required int index,
  required BuildContext context,
}) {
  return ListTile(
    title: Text(
      todo.title,
      style: TextStyle(
        decoration:
            todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        color: todo.isDone ? Colors.grey : Colors.white,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: todo.isDone,
          onChanged: (value) => context.read<TodoList>().todoDone(index: index),
        ),
        IconButton(
          onPressed: () => context.read<TodoList>().todoRemove(todo: todo),
          icon: const Icon(Icons.delete, color: Colors.redAccent),
        ),
      ],
    ),
  );
}
