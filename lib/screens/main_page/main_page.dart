import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_page/add_page.dart';
import 'package:todo_app/screens/main_page/widgets/todo_item_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ToDoItemWidget(
              title: 'Todo $index',
              description: "Todo",
            );
          }),
    );
  }
}
