import 'package:flutter/material.dart';
import 'package:todo_app/models/TodoModel.dart';

class AddPage extends StatefulWidget {
  static const String routeName = '/add';

  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void onSubmit(context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(
          context,
          ToDo(
            title: _titleController.text,
            description: _descriptionController.text,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
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
                onPressed: () => onSubmit(context),
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
