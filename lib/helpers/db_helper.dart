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
          "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, label_id INTEGER, priority INTEGER, start_time DATETIME, end_time DATETIME, description TEXT, reminder DATETIME, int status)");
      //labels table
      await db.execute(
          "CREATE TABLE labels (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)");
      //subtasks table
      await db.execute(
          "CREATE TABLE subtasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, order INTEGER, task_id INTEGER)");
    }, version: 1);
  }

  //ADDICTION OPERATIONS START

  // Future<int> addTask(Addiction object) async {
  //   final db = await database;
  //   var addictionID = 0;

  //   addictionID = await db.rawInsert(
  //       "insert into addictions (title, category_id, date) values(?,?,?)", [
  //     object.title,
  //     object.categoryID,
  //     object.date.toString(),
  //   ]);

  //   await db.rawInsert(
  //       "insert into loops (start_date, finish_date, done, addiction_id) values(?,?,?,?)",
  //       [
  //         object.loop.startDate.toString(),
  //         object.loop.finishDate.toString(),
  //         0,
  //         addictionID,
  //       ]);

  //   return addictionID;
  // }
}
