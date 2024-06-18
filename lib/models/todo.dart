class Todo {
  final String title;
  bool isDone;

  Todo({required this.title, required this.isDone});

  void taskDone() => isDone = !isDone;
}
