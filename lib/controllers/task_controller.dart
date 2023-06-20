import 'package:plan_your_life/helpers/db_helper.dart';

import '../index.dart';

class TaskController extends GetxController {
  Future<ResponseModel> addTask(TaskModel taskModel) async {
    try {
      var response = await DBHelper.db.addTask(taskModel);

      if (response == -1) {
        return ResponseModel(
          status: "error",
          message: "There is an error occurred, please try it again.",
        );
      }

      return ResponseModel(
        status: "success",
        message: "The task has been created successfully.",
      );
    } catch (e) {
      // ignore: avoid_print
      print("error: ${e.toString()}");
      return ResponseModel(
        status: "error",
        message: "There is an error occurred, please try it again.",
      );
    }
  }
}
