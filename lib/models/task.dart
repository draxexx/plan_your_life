import '../index.dart';

class TaskModel {
  int? _id;
  String? _title;
  LabelModel? _label;
  int? _priority;
  DateTime? _startTime;
  DateTime? _endTime;
  String? _description;
  DateTime? _reminder;
  int? _status;

  TaskModel({
    int? id,
    String? title,
    LabelModel? label,
    int? priority,
    DateTime? startTime,
    DateTime? endTime,
    String? description,
    DateTime? reminder,
    int? status,
  }) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (label != null) {
      _label = label;
    }
    if (priority != null) {
      _priority = priority;
    }
    if (startTime != null) {
      _startTime = startTime;
    }
    if (endTime != null) {
      _endTime = endTime;
    }
    if (description != null) {
      _description = description;
    }
    if (reminder != null) {
      _reminder = reminder;
    }
    if (status != null) {
      _status = status;
    }
  }

  int? get id => _id;
  set setId(int? id) => _id = id;
  LabelModel? get label => _label;
  set setLabel(LabelModel? label) => _label = label;
  String? get title => _title;
  set setTitle(String? title) => _title = title;
  int? get priority => _priority;
  set setPriority(int? priority) => _priority = priority;
  DateTime? get startTime => _startTime;
  set setStartTime(DateTime? startTime) => _startTime = startTime;
  DateTime? get endTime => _endTime;
  set setEndTime(DateTime? endTime) => _endTime = endTime;
  String? get description => _description;
  set setDescription(String? description) => _description = description;
  DateTime? get reminder => _reminder;
  set setReminder(DateTime? reminder) => _reminder = reminder;
  int? get status => _status;
  set setStatus(int? status) => _status = status;

  TaskModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _label = json['label'] != null ? LabelModel.fromJson(json['label']) : null;
    _title = json['title'];
    _priority = json['priority'];
    _startTime =
        json['start_time'] != null ? DateTime.parse(json['start_time']) : null;
    _endTime =
        json['end_time'] != null ? DateTime.parse(json['end_time']) : null;
    _description = json['description'];
    _reminder =
        json['reminder'] != null ? DateTime.parse(json['reminder']) : null;
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    if (_label != null) {
      data['label'] = _label!.toJson();
    }
    data['title'] = _title;
    data['priority'] = _priority;
    data['start_time'] = _startTime.toString();
    data['end_time'] = _endTime.toString();
    data['description'] = _description;
    data['reminder'] = _reminder.toString();
    data['status'] = _status;
    return data;
  }
}
