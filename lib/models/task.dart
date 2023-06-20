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
  List<SubtaskModel>? _subtaskList;

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
    List<SubtaskModel>? subtaskList,
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
    if (subtaskList != null) {
      _subtaskList = subtaskList;
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
  TimeOfDay? get startTimeOfDay => _startTime == null
      ? null
      : TimeOfDay(hour: _startTime!.hour, minute: _startTime!.minute);
  set setStartTime(DateTime? startTime) => _startTime = startTime;
  String? get formattedStartTime =>
      _startTime == null ? null : DateFormat("HH:mm").format(_startTime!);
  DateTime? get endTime => _endTime;
  TimeOfDay? get endTimeOfDay => _endTime == null
      ? null
      : TimeOfDay(hour: _endTime!.hour, minute: _endTime!.minute);
  set setEndTime(DateTime? endTime) => _endTime = endTime;
  String? get formattedEndTime =>
      _endTime == null ? null : DateFormat("HH:mm").format(_endTime!);
  String? get description => _description;
  set setDescription(String? description) => _description = description;
  DateTime? get reminder => _reminder;
  TimeOfDay? get reminderTimeOfDay => _reminder == null
      ? null
      : TimeOfDay(hour: _reminder!.hour, minute: _reminder!.minute);
  set setReminder(DateTime? reminder) => _reminder = reminder;
  String? get formattedReminder =>
      _reminder == null ? null : DateFormat("HH:mm").format(_reminder!);
  int? get status => _status;
  set setStatus(int? status) => _status = status;
  List<SubtaskModel>? get subtaskList => _subtaskList;
  set setSubtaskList(List<SubtaskModel>? subtaskList) =>
      _subtaskList = subtaskList;

  void setTime(String type, TimeOfDay time) {
    if (type == "start") {
      _startTime = DateTime(_startTime!.year, _startTime!.month,
          _startTime!.day, time.hour, time.minute);
    } else if (type == "end") {
      _endTime = DateTime(_endTime!.year, _endTime!.month, _endTime!.day,
          time.hour, time.minute);
    } else {
      _reminder = DateTime(_reminder!.year, _reminder!.month, _reminder!.day,
          time.hour, time.minute);
    }
  }

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

    if (json['subtasks'] != null) {
      _subtaskList = <SubtaskModel>[];
      json['subtasks'].forEach((v) {
        _subtaskList!.add(SubtaskModel.fromJson(v));
      });
    }
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

    if (_subtaskList != null) {
      data['subtasks'] = _subtaskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
