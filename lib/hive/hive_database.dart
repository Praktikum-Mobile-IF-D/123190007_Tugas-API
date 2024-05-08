import 'package:hive_flutter/hive_flutter.dart';
import 'package:ta_mobile/model_hive/datauser_model.dart';

class HiveDatabase {
  static final Box<DataUserModel> _localDB = Hive.box<DataUserModel>("data_user");

  void addData(DataUserModel data) {
    _localDB.add(data);
  }

  int getLength() {
    return _localDB.length;
  }

  bool checkLogin(String username, String birth, String password) {
    bool found = false;
    for (int i = 0; i < getLength(); i++) {
      if (username == _localDB.getAt(i)!.username &&
          birth    == _localDB.getAt(i)!.birth &&
          password == _localDB.getAt(i)!.password) {
        print("Login Berhasil");
        found = true;
        break;
      }
      else {
        found = false;
      }
    }
    return found;
  }
}
