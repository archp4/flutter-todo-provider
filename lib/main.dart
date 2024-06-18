import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_notifier.dart';
import 'package:todo_app/routes/add_todo.dart';
import 'routes/homepage.dart';

void main() {
  runApp(
    // Adding Provider on Top of App
    ChangeNotifierProvider(
      create: (context) => TodoList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/', // Route When We Open Page
      routes: {
        '/': (_) => const Homepage(), // Route to HomePage
        '/add-todo': (_) => const AddTodo(), // Adding Todo Screen
      },
    );
  }
}
