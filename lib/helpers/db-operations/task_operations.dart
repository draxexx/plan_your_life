import '../../index.dart';

class TaskOperations {
  //ADD TASK

  Future<int> addTask(TaskModel object) async {
    final db = await DBHelper.db.database;
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

  Future<dynamic> getAllTasks() async {
    final db = await DBHelper.db.database;
    const String sql = "select json_group_object(id) as result from tasks";
    var res = await db.rawQuery(sql);

    if (res.isEmpty) {
      return null;
    } else {
      var resMap = res;
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
