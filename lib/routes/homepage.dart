import 'package:flutter/material.dart';
import 'package:todo_app/widgets/default_appbar.dart';
import 'package:todo_app/widgets/todo_listview.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/add-todo'),
      ),
      body: const TodoListView(),
    );
  }
}
