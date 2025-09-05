import 'package:flutter/material.dart';
import 'package:ticktask/utils/buttons.dart';

class dialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onDelete;
  dialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // adding task
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'add a new task',
              ),
            ),
            // buttons for save or delete
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                myButtons(text: 'Save', onPressed: onSave),

                SizedBox(width: 8),

                // delete button
                myButtons(text: 'Delete', onPressed: onDelete),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
