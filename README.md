# Todo App

This Flutter Todo App with statement provider

## Getting Started With Step to Create App

Models

```dart
class Todo {
  final String title;
  bool isDone;

  Todo({required this.title, required this.isDone});

  void taskDone() => isDone = !isDone;
}
```

```dart
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
```

### Main.dart File

```dart
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

```

### Widgets

#### Appbar

```dart
AppBar getAppBar() {
  return AppBar(
    title: const Text("Todo App"),
    centerTitle: true,
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
    ],
  );
}
```

#### TodoListView

```dart
class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        // Consumer is Provider Widget Which rebulid every time there is updated in TodoList provider
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
```

#### Todo Tile

```dart
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
```

### Routes (Pages or Views)

#### Homepage

```dart
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
```

#### Add Todo Route

```dart


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


```
