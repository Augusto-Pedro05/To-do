import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'task_dao.dart';

Future<Database> getDatabase() async{
  final String path = join(await getDatabasesPath(), 'tasks.db');
  return openDatabase(path, onCreate: (db, version){
    db.execute(TaskDao.tablesql);
  }, version: 1);
}