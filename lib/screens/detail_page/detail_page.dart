import 'package:flutter/material.dart';
import 'package:todo_app/models/TodoModel.dart';
import 'package:todo_app/screens/edit_page/edit_page.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = '/detail';
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ToDo todo;
  late Function onChange;
  late Function onDelete;

  @override
  void didChangeDependencies() {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    todo = arguments['todo'] as ToDo;
    onDelete = arguments['onDelete'] as Function;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditPage.routeName,
                arguments: {
                  'todo': todo,
                  'onEdit': () {},
                },
              ).then((_) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(todo);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              todo.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    todo.done = !todo.done;
                  });
                },
                child: Text(todo.done ? 'Undone' : 'Mark as Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
