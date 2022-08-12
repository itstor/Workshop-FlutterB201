import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/models/TodoModel.dart';
import 'package:todo_app/screens/add_page/add_page.dart';
import 'package:todo_app/screens/main_page/widgets/todo_item_widget.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/';
  final List<ToDo> todos = [
    ToDo(
      title: 'Buy Milk',
      description: 'Buy milk for the family',
      done: false,
    ),
    ToDo(
      title: 'Buy Eggs',
      description: 'Buy eggs for the family',
      done: false,
    ),
    ToDo(
      title: 'Buy Bread',
      description: 'Buy bread for the family',
      done: false,
    ),
  ];

  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void addTodo() async {
    final ToDo? todo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddPage(),
      ),
    );

    if (todo != null) {
      setState(() {
        widget.todos.add(todo);
      });
    }
  }

  void deleteTodo(ToDo todo) {
    setState(() {
      widget.todos.remove(todo);
    });
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
          itemCount: widget.todos.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ToDoItemWidget(
              todo: widget.todos[index],
              onDelete: deleteTodo,
              refresh: refresh,
            );
          }),
    );
  }
}
