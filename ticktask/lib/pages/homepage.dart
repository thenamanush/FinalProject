import 'package:flutter/material.dart';
import 'package:ticktask/utils/todotile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color
      backgroundColor: Colors.white,

      // app bar
      appBar: AppBar(
        title: const Text(
          'To Do',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),

      // todo tiles
      body: ListView(
        children: [
          todoList(taskName: 'Make App', flag: true, onChanged: (p0) {}),
          todoList(taskName: 'push to github', flag: false, onChanged: (p0) {}),
        ],
      ),
    );
  }
}
