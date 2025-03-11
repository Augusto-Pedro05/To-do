import 'package:sqflite/sqflite.dart';
import '../components/task.dart';
import 'database.dart';

class TaskDao {
  static const String tablesql =
      'CREATE TABLE $_tablename('
      '$_title TEXT, '
      '$_description TEXT)';

  static const String _tablename = 'tasks';
  static const String _title = 'title';
  static const String _description = 'description';

  save(Task task) async {
    print('Saving task: ${task.titulo}');
    final Database db = await getDatabase();
    Map<String, dynamic> mapTask = toMap(task);
    await db.insert(_tablename, mapTask);
    print('Task saved');
  }

  Map<String, dynamic> toMap(Task task) {
    print('Converting task to map');
    final Map<String, dynamic> map = {};
    map[_title] = task.titulo;
    map[_description] = task.descricao;
    print('Map converted: $map');
    return map;
  }

  Future<List<Task>> findAll() async {
    print('Finding all tasks');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('Tasks found: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> result) {
    print('Converting map to list');
    final List<Task> tasks = [];
    for (Map<String, dynamic> row in result) {
      final Task task = Task(row[_title], descricao: row[_description]);
      tasks.add(task);
    }
    print('List converted: $tasks');
    return tasks;
  }

  Future<List<Task>> find(String taskName) async {
    print('Finding task: $taskName');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_title = ?',
      whereArgs: [taskName],
    );
    print('Task found: $result');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deleting task: $taskName');
    final Database database = await getDatabase();
    await database.delete(
      _tablename,
      where: '$_title = ?',
      whereArgs: [taskName],
    );
    print('Task deleted');
  }
}
