import '../index.dart';

class LabelController extends GetxController {
  LabelOperations label = LabelOperations();

  Future<ResponseModel> addLabel(LabelModel labelModel) async {
    try {
      var response = await label.addLabel(labelModel);

      if (response == -1) {
        return ResponseModel(
          status: "error",
          message: "There is an error occurred, please try it again.",
        );
      }

      return ResponseModel(
        status: "success",
        message: "The label has been created successfully.",
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
