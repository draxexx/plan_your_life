class ResponseModel {
  int? _code;
  String? _status;
  String? _message;
  dynamic _data;

  ResponseModel({int? code, String? status, String? message, dynamic data}) {
    if (code != null) {
      _code = code;
    }
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get code => _code;
  // set code(String? code) => _code = code;
  String? get status => _status;
  // set status(String? status) => _status = status;
  String? get message => _message;
  // set message(String? message) => _message = message;
  dynamic get data => _data;
  // set data(String? data) => _data = data;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code;
    data['status'] = _status;
    data['message'] = _message;
    data['data'] = _data;
    return data;
  }
}
