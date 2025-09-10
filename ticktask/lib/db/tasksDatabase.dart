import 'package:supabase_flutter/supabase_flutter.dart';

class TasksDatabase {
  // reference to Supabase client
  final _supabase = Supabase.instance.client;

  // table name
  final String _tasksTable = 'Tasks';

  // ✅ Create (insert a new task)
  Future<void> addTask(String title, bool isdone) async {
    await _supabase.from(_tasksTable).insert({
      'content': title,
      'flag': isdone,
    });
  }

  // ✅ Read (get all tasks)
  Future<List<Map<String, dynamic>>> getTasks() async {
    final response = await _supabase.from(_tasksTable).select();
    return response as List<Map<String, dynamic>>;
  }

  // ✅ Update (edit a task)
  Future<void> updateTask(int id, String title, bool isDone) async {
    await _supabase
        .from(_tasksTable)
        .update({'content': title, 'flag': isDone})
        .eq('id', id);
  }

  // ✅ Delete (remove a task)
  Future<void> deleteTask(int id) async {
    await _supabase.from(_tasksTable).delete().eq('id', id);
  }
}
