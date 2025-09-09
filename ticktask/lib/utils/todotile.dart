import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoTile extends StatelessWidget {
  final String taskName;
  final bool flag;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunc;
  Function(BuildContext)? editFunc;

  todoTile({
    super.key,
    required this.taskName,
    required this.flag,
    required this.onChanged,
    required this.deleteFunc,
    this.editFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => editFunc?.call(context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
