import 'package:flutter/material.dart';
import 'package:to_do/data/task_inherited.dart';
import 'package:to_do/screens/add_task.dart';

import '../components/task.dart';
import '../data/task_dao.dart';

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
              child: FutureBuilder<List<Task>>(
                future: TaskDao().findAll(),
                builder: (context, snapshot){
                  List<Task>? items = snapshot.data;
                  switch (snapshot.connectionState){

                    case ConnectionState.none:
                      return Center(
                        child: Column(
                          children: [CircularProgressIndicator(), Text('Carregando')],
                        ),
                      );
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          children: [CircularProgressIndicator(), Text('Carregando')],
                        ),
                      );
                    case ConnectionState.active:
                      return Center(
                        child: Column(
                          children: [CircularProgressIndicator(), Text('Carregando')],
                        ),
                      );
                    case ConnectionState.done:
                      if(snapshot.hasData && items != null){
                        if(items.isNotEmpty){
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder:  (BuildContext context, int index){
                              final Task tarefa = items[index];
                              return Row(
                                children: [
                                  tarefa,
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        TaskDao().delete(tarefa.titulo);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Color.fromRGBO(255, 255, 255, 0.25),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return Center(
                          child: Text("Nenhuma tarefa encontrada"),
                        );
                      }
                      return Center(child: Text("Erro ao carregar tarefas"));
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 110,
        height: 40,
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
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 20),
              Text(
                ' Add Task',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}