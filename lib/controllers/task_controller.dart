import '../index.dart';

class TaskController extends GetxController {
  TaskOperations task = TaskOperations();

  Future<ResponseModel> addTask(TaskModel taskModel) async {
    try {
      var response = await task.addTask(taskModel);

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
