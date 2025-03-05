import 'package:flutter/material.dart';
import 'package:to_do/data/task_inherited.dart';
import 'package:to_do/screens/add_task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(221, 221, 221, 1),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(
            height: 8,
            thickness: 1,
            indent: 16,
            endIndent: 18,
            color: Color.fromRGBO(255, 255, 255, 0.25),
          ),
          Expanded(
            child: Scrollbar(
              thickness: 7,
              radius: Radius.circular(10),
              child: ListView.builder(
                itemCount: TaskInherited.of(context).tasks.length,
                itemBuilder: (context, index) {
                  return TaskInherited.of(context).tasks[index];
                },
                padding: EdgeInsets.only(top: 8, bottom: 90),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 50,
        child: FloatingActionButton(
          onPressed: () async{
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (newContext) => AddTaskPage(taskContext: context),
              ),
            );
            setState(() {});
          },
          backgroundColor: Color.fromRGBO(76, 175, 80, 0.50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.white, size: 20),
              Text(
                'Add Task',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}