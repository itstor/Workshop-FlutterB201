import 'package:flutter/material.dart';
import 'package:todo_app/models/TodoModel.dart';

class EditPage extends StatefulWidget {
  static const String routeName = '/edit';
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late ToDo todo;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    todo = arguments['todo'] as ToDo;

    _titleController.text = todo.title;
    _descriptionController.text = todo.description;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit ToDo'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _descriptionController,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    todo.title = _titleController.text;
                    todo.description = _descriptionController.text;
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
