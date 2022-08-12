import 'package:flutter/material.dart';
import 'package:todo_app/models/TodoModel.dart';
import 'package:todo_app/screens/detail_page/detail_page.dart';
import 'package:todo_app/screens/edit_page/edit_page.dart';

class ToDoItemWidget extends StatefulWidget {
  final ToDo todo;
  final Function onDelete;
  final Function refresh;

  const ToDoItemWidget({
    Key? key,
    required this.todo,
    required this.onDelete,
    required this.refresh,
  }) : super(key: key);

  @override
  State<ToDoItemWidget> createState() => _ToDoItemWidgetState();
}

class _ToDoItemWidgetState extends State<ToDoItemWidget> {
  void changeDone(value) {
    setState(() {
      widget.todo.done = value;
    });
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.done,
        onChanged: changeDone,
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.routeName,
          arguments: {
            'todo': widget.todo,
            'onDelete': widget.onDelete,
          },
        ).then((value) => setState(() {}));
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditPage.routeName,
                arguments: {
                  'todo': widget.todo,
                },
              ).then((_) => setState(() {}));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => widget.onDelete(widget.todo),
          ),
        ],
      ),
      title: Text(widget.todo.title),
      subtitle: Text(widget.todo.description),
    );
  }
}
