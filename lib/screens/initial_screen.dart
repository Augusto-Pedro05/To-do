import 'package:flutter/material.dart';
import 'package:to_do/components/task.dart';

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
              child: ListView(
                padding: EdgeInsets.only(top: 8, bottom: 90),
                children: [
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(_slideUpRoute(NovaTela()));
          },
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.60),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.green, size: 20),
              Text(
                'Add Task',
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NovaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tela"),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(221, 221, 221, 1),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
        ),
        centerTitle: true,
      ),
      body: Center(child: Text("Esta é a nova tela!")),
    );
  }
}

Route _slideUpRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0, 1); // Começa de baixo (1 = fora da tela)
      var end = Offset.zero; // Termina na posição normal
      var curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Arredonda o topo esquerdo
          topRight: Radius.circular(20), // Arredonda o topo direito
        ),
        child: SlideTransition(
          position: offsetAnimation,
          child: child, // Aplica o arredondamento ao conteúdo da animação
        ),
      );
    },
  );
}
