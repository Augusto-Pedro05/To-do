import 'package:flutter/material.dart';
import 'package:to_do/components/task.dart';
import '../data/task_inherited.dart';

class AddTaskPage extends StatefulWidget {

  const AddTaskPage({super.key, required this.taskContext});
  final BuildContext taskContext;

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nova Tarefa"),
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(221, 221, 221, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Satoshi',
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Título",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira o nome da tarefa';
                    }
                    return null;
                  },
                  controller: _tituloController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite o título",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _descricaoController,
                  maxLines: 16,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite a descrição",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(_tituloController.text);
                        print(_descricaoController.text);
                        TaskInherited.of(widget.taskContext).addTask(
                            Task(_tituloController.text, descricao: _descricaoController.text,)
                        );
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(
                          content: Text("Tarefa salva"),
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}