import 'package:flutter/material.dart';

AppBar getAppBar() {
  return AppBar(
    title: const Text("Todo App"),
    centerTitle: true,
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
    ],
  );
}
