import 'package:flutter/material.dart';
import '../components/task.dart';

class TaskInherited extends StatefulWidget {
  final Widget child;

  const TaskInherited({Key? key, required this.child}) : super(key: key);

  static _TaskInheritedState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_TaskInheritedWidget>()!.data;
  }

  @override
  _TaskInheritedState createState() => _TaskInheritedState();
}

class _TaskInheritedState extends State<TaskInherited> {
  final List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TaskInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _TaskInheritedWidget extends InheritedWidget {
  final _TaskInheritedState data;

  const _TaskInheritedWidget({required this.data, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_TaskInheritedWidget oldWidget) {
    return oldWidget.data.tasks.length != data.tasks.length;
  }
}
