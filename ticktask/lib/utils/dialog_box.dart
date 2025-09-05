import 'package:flutter/material.dart';

class dialogBox extends StatelessWidget {
  dialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          children: [
            // adding task
            TextField(),

            // buttons for save or delete
          ],
        ),
      ),
    );
  }
}
