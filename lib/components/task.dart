import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task(this.titulo, {super.key, this.descricao = ''});

  final String titulo;
  final String descricao;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
                isChecked = value ?? false;
            });
          },
          activeColor: Colors.green,
          // Cor quando marcado
          checkColor: Colors.white,
          // Cor do ícone ✓
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          child: SizedBox(
            width: 300,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titulo,
                  style: TextStyle(
                    decoration: (isChecked) ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Color.fromRGBO(255, 255, 255, 0.25),
                    decorationThickness: 2.7,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: (isChecked) ? Color.fromRGBO(255, 255, 255, 0.25) : Colors.white,
                  ),
                ),
                Text(
                  widget.descricao,
                  style: TextStyle(
                    decoration: (isChecked) ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Color.fromRGBO(255, 255, 255, 0.25),
                    decorationThickness: 2.5,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: (isChecked) ? Color.fromRGBO(255, 255, 255, 0.25) : Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
