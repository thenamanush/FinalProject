import 'package:flutter/material.dart';
import 'package:ticktask/db/tasksDatabase.dart';
import 'package:ticktask/utils/dialog_box.dart';
import 'package:ticktask/utils/todotile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final db = TasksDatabase();

  List<Map<String, dynamic>> todoList = [];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  // ✅ Get tasks from Supabase
  Future<void> fetchTasks() async {
    final tasks = await db.getTasks();
    setState(() {
      todoList = tasks;
    });
  }

  // ✅ Save new task
  Future<void> saveTask() async {
    if (_controller.text.trim().isEmpty) return;

    await db.addTask(_controller.text.trim(), false);
    _controller.clear();
    Navigator.of(context).pop();
    fetchTasks();
  }

  // ✅ Delete task
  Future<void> deleteTask(int id) async {
    await db.deleteTask(id);
    fetchTasks();
  }

  // ✅ Edit task
  Future<void> editTask(int id, String currentTitle) async {
    _controller.text = currentTitle;
    showDialog(
      context: context,
      builder: (context) {
        return dialogBox(
          controller: _controller,
          onSave: () async {
            await db.updateTask(id, _controller.text.trim(), false);
            _controller.clear();
            Navigator.of(context).pop();
            fetchTasks();
          },
          onDelete: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // ✅ Mark complete/incomplete
  Future<void> toggleComplete(int id, bool isDone, String title) async {
    await db.updateTask(id, title, !isDone);
    fetchTasks();
  }

  // ✅ Create new task dialog
  void createNewTask() {
    _controller.clear();
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
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'To Do',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.black),
      ),

      body: todoList.isEmpty
          ? const Center(child: Text("No tasks yet"))
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final task = todoList[index];
                return todoTile(
                  taskName: task['content'],
                  flag: task['flag'],
                  onChanged: (value) =>
                      toggleComplete(task['id'], task['flag'], task['content']),
                  deleteFunc: (context) => deleteTask(task['id']),
                  editFunc: (context) => editTask(task['id'], task['content']),
                );
              },
            ),
    );
  }
}
