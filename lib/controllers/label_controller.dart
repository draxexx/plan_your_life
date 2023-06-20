import '../index.dart';

class LabelController extends GetxController {
  LabelOperations label = LabelOperations();

  final RxList<LabelModel> _labelList = <LabelModel>[].obs;

  List<LabelModel>? get labelList => _labelList;

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

  Future<ResponseModel> getAllLabels() async {
    _labelList.clear();

    try {
      var response = await label.getAllLabels();

      if (response == null) {
        return ResponseModel(
          status: "error",
          message: "There is an error occurred, please try it again.",
        );
      }

      for (var i in response) {
        _labelList.add(LabelModel.fromJson(i));
      }

      return ResponseModel(
        status: "success",
        message: "All labels fetched successfully.",
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
