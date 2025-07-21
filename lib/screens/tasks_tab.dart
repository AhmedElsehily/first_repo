import 'package:app/model/task_model.dart';
import 'package:flutter/material.dart';

class TasksTab extends StatefulWidget {
  final List<Task> tasks;
  final Function(String) onAddTask;
  final Function(int) onDeleteTask;
  final Function(int) onToggleComplete;

  const TasksTab({
    Key? key,
    required this.tasks,
    required this.onAddTask,
    required this.onDeleteTask,
    required this.onToggleComplete,
  }) : super(key: key);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final TextEditingController _taskController = TextEditingController();

  void _handleAddTask() {
    final taskName = _taskController.text.trim();
    if (taskName.isNotEmpty) {
      widget.onAddTask(taskName);
      _taskController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: 'New Task',
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: _handleAddTask,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                final task = widget.tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      task.name,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text("Created by: ${task.createdBy}"),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        IconButton(
                          icon: Icon(Icons.check,
                              color: task.isCompleted
                                  ? Colors.green
                                  : Colors.grey),
                          onPressed: () => widget.onToggleComplete(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => widget.onDeleteTask(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

























//==========
/* import 'package:flutter/material.dart';

class TasksTab extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(String) onAddTask;
  final Function(int) onDeleteTask;
  final Function(int) onToggleComplete;

  const TasksTab({
    Key? key,
    required this.tasks,
    required this.onAddTask,
    required this.onDeleteTask,
    required this.onToggleComplete,
  }) : super(key: key);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final TextEditingController _controller = TextEditingController();

  void _handleAdd() {
    final taskText = _controller.text.trim();
    if (taskText.isNotEmpty) {
      widget.onAddTask(taskText);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'New Task',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: _handleAdd,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: widget.tasks.isEmpty
                ? Center(child: Text("No tasks yet"))
                : ListView.builder(
                    itemCount: widget.tasks.length,
                    itemBuilder: (context, index) {
                      final task = widget.tasks[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          title: Text(
                            task['task'],
                            style: TextStyle(
                              decoration: task['completed']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Text("Created By: ${task['createdBy']}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check,
                                    color: task['completed']
                                        ? Colors.green
                                        : Colors.grey),
                                onPressed: () =>
                                    widget.onToggleComplete(index),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => widget.onDeleteTask(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
 */