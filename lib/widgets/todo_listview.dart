import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_notifier.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        child: Consumer<TodoList>(
          builder: (context, todoList, child) => ListView.builder(
            itemCount: todoList.todos.length,
            itemBuilder: (context, index) => todoTile(
              todo: todoList.todos[index],
              index: index,
              context: context,
            ),
          ),
        ),
      ),
    );
  }
}
