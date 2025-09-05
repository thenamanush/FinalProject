import 'package:flutter/material.dart';
import 'package:ticktask/utils/todotile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override // jello
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // to do list
  List todoList = [
    ['make app', false],
    ['do work', true],
    ['play game', false],
  ];

  void checkboxChanged(bool? val, int ind) {
    setState(() {
      todoList[ind][1] = !todoList[ind][1];
    });
  }

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
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return todoTile(
            taskName: todoList[index][0],
            flag: todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
          );
        },
      ),
    );
  }
}
