class LabelModel {
  int? _id;
  String? _name;

  LabelModel({
    int? id,
    String? name,
  }) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
  }

  int? get id => _id;
  set setId(int? id) => _id = id;
  String? get name => _name;
  set setName(String? name) => _name = name;

  LabelModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}
