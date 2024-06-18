import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_notifier.dart';
import 'package:todo_app/widgets/default_appbar.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(),
        alignment: Alignment.center,
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Todo',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    context.read<TodoList>().addTodo(
                          todo: Todo(title: controller.text, isDone: false),
                        );

                    Navigator.pop(context);

                    Scaffold.of(context).showBottomSheet(
                      (_) => const SnackBar(
                        content: Text("Todo Added!!"),
                      ),
                    );
                  }
                },
                child: const Text("Add Todo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
