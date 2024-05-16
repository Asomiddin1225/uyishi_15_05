import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vazifalar Ro\'yxati',
      home: TaskList(),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> _tasks = [
    Task(
      isCompleted: true,
      title: 'Nonushta',
    ),
    Task(
      isCompleted: true,
      title: 'Darsga kelish',
    ),
    Task(
      isCompleted: false,
      title: 'Uy Vazifasini bajarish',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vazifalar Ro'yxati"),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index].title),
            trailing: Checkbox(
              value: _tasks[index].isCompleted,
              onChanged: (value) {
                setState(() {
                  _tasks[index].isCompleted = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, required this.isCompleted});
}
