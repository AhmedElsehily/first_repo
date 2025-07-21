class Task {
  String name;
  String createdBy;
  bool isCompleted;

  Task({
    required this.name,
    required this.createdBy,
    this.isCompleted = false,
  });
}
