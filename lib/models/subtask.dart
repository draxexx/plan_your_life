import '../index.dart';

class SubtaskModel {
  int? _id;
  String? _title;
  int? _order;
  TaskModel? _task;

  SubtaskModel({
    int? id,
    String? title,
    int? order,
    TaskModel? task,
  }) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (order != null) {
      _order = order;
    }
    if (task != null) {
      _task = task;
    }
  }

  int? get id => _id;
  set setId(int? id) => _id = id;
  String? get title => _title;
  set setTitle(String? title) => _title = title;
  int? get order => _order;
  set setOrder(int? order) => _order = order;
  TaskModel? get task => _task;
  set settask(TaskModel? task) => _task = task;

  SubtaskModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _order = json['order'];
    _task = json['task'] != null ? TaskModel.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['order'] = _order;
    if (_task != null) {
      data['task'] = _task!.toJson();
    }
    return data;
  }
}
