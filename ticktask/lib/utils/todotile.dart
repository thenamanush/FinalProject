import 'package:flutter/material.dart';

class todoList extends StatelessWidget {
  final String taskName;
  final bool flag;
  Function(bool?)? onChanged;

  todoList({
    super.key,
    required this.taskName,
    required this.flag,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Row(
            children: [
              Checkbox(value: flag, onChanged: onChanged),
              Text(taskName),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
