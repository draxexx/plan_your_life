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
}
