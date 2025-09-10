import 'package:supabase_flutter/supabase_flutter.dart';

class TasksDatabase {
  final _supabase = Supabase.instance.client;
  //table
  final String _tasksTable = 'Tasks';

  // create new task
  Future<void> addTask(String task, bool isdone) async {
    await _supabase.from(_tasksTable).insert({'content': task, 'flag': isdone});
  }

  // show task from database
  Future<List<Map<String, dynamic>>> getTasks() async {
    final response = await _supabase.from(_tasksTable).select();
    return response as List<Map<String, dynamic>>;
  }

  //edit task
  Future<void> updateTask(int id, String task, bool isDone) async {
    await _supabase
        .from(_tasksTable)
        .update({'content': task, 'flag': isDone})
        .eq('id', id);
  }

  // delete task
  Future<void> deleteTask(int id) async {
    await _supabase.from(_tasksTable).delete().eq('id', id);
  }
}
