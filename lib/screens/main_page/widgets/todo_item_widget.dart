import 'package:flutter/material.dart';
import 'package:todo_app/screens/detail_page/detail_page.dart';
import 'package:todo_app/screens/edit_page/edit_page.dart';

class ToDoItemWidget extends StatefulWidget {
  final String title;
  final String description;
  final bool isDone;

  const ToDoItemWidget({
    Key? key,
    this.isDone = false,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<ToDoItemWidget> createState() => _ToDoItemWidgetState();
}

class _ToDoItemWidgetState extends State<ToDoItemWidget> {
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _isDone = widget.isDone;
  }

  void checkboxChanged(bool? value) {
    setState(() {
      _isDone = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _isDone,
        onChanged: checkboxChanged,
      ),
      onTap: () {
        setState(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage(),
              ),
            );
          },
        );
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      title: Text(widget.title),
      subtitle: Text(widget.description),
    );
  }
}
