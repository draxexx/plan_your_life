import 'package:path/path.dart' as p;

import '../index.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    return await openDatabase(
        p.join(await getDatabasesPath(), "plan_your_life.db"),
        onCreate: (db, version) async {
      //tasks table
      await db.execute(
        "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, label_id INTEGER, priority INTEGER, start_time DATETIME, end_time DATETIME, description TEXT, reminder DATETIME, status INTEGER)",
      );
      //labels table
      await db.execute(
        "CREATE TABLE labels (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)",
      );
      //subtasks table
      await db.execute(
        "CREATE TABLE subtasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, subtask_order INTEGER, status INTEGER, task_id INTEGER)",
      );
    }, version: 1);
  }

  //ADD TASK

  Future<int> addTask(TaskModel object) async {
    final db = await database;
    var taskID = -1;

    // add task
    taskID = await db.rawInsert(
        "insert into tasks (title, label_id, priority, start_time, end_time, description, reminder, status) values(?,?,?,?,?,?,?,?)",
        [
          object.title,
          object.label!.id,
          object.priority,
          object.startTime.toString(),
          object.endTime.toString(),
          object.description,
          object.reminder.toString(),
          object.status,
        ]);

    // add subtask if it isn't empty
    if (object.subtaskList!.isNotEmpty) {
      for (var i in object.subtaskList!) {
        await db.rawInsert(
            "insert into subtasks (title, subtask_order, status, task_id) values(?,?,?,?)",
            [
              i.title,
              i.order,
              i.status,
              taskID,
            ]);
      }
    }

    return taskID;
  }
}
