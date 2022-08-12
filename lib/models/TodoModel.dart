class ToDo {
  String title;
  String description;
  bool done;

  ToDo({
    required this.title,
    required this.description,
    this.done = false,
  });
}
