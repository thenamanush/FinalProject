import 'package:flutter/material.dart';
import 'package:ticktask/utils/dialog_box.dart';
import 'package:ticktask/utils/todotile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();

  // to do list
  List todoList = [
    ['make app', false],
    ['do work', true],
    ['play game', false],
  ];

  // mark completed tasks
  void checkboxChanged(bool? val, int ind) {
    setState(() {
      todoList[ind][1] = !todoList[ind][1];
    });
  }

  // save new task
  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // create new task
  void createNewTask() {
    //
    showDialog(
      context: context,
      builder: (context) {
        return dialogBox(
          controller: _controller,
          onSave: saveTask,
          onDelete: Navigator.of(context).pop,
        );
      },
    );
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

      // add task
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellowAccent,
        child: const Icon(Icons.add, color: Colors.black),
      ),

      // todo tiles
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return todoTile(
            taskName: todoList[index][0],
            flag: todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunc: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
