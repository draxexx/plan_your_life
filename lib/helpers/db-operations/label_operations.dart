import '../../index.dart';

class LabelOperations {
  //ADD LABEL

  Future<int> addLabel(LabelModel object) async {
    final db = await DBHelper.db.database;
    var returnID = -1;

    returnID = await db.rawInsert("insert into labels (name) values(?)", [
      object.name,
    ]);

    return returnID;
  }

  Future<dynamic> getAllLabels() async {
    final db = await DBHelper.db.database;
    const String sql = "select id, name from labels";
    var res = await db.rawQuery(sql);

    if (res.isEmpty) {
      return null;
    } else {
      var resMap = res;
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
