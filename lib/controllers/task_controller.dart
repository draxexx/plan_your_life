import '../index.dart';

class TaskController extends GetxController {
  // TaskOperations task = TaskOperations();

  final RxList<TaskModel> _taskList = <TaskModel>[].obs;

  List<TaskModel>? get taskList => _taskList;

  Future<ResponseModel> addTask(TaskModel taskModel) async {
    try {
      // var response = await task.addTask(taskModel);

      // if (response == -1) {
      //   return ResponseModel(
      //     status: "error",
      //     message: "There is an error occurred, please try it again.",
      //   );
      // }

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

  Future<ResponseModel> getAllTasks() async {
    _taskList.clear();

    try {
      var response = await getRequest(path: "/tasks");

      if (response.data != null) {
        for (var i in response.data) {
          _taskList.add(TaskModel.fromJson(i));
        }
      }

      return response;
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
