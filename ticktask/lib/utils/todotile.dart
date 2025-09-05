import 'package:flutter/material.dart';

class todoTile extends StatelessWidget {
  final String taskName;
  final bool flag;
  Function(bool?)? onChanged;

  todoTile({
    super.key,
    required this.taskName,
    required this.flag,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Row(
            children: [
              Checkbox(
                value: flag,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: flag
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
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
