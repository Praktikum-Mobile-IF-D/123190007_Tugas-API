import 'package:hive/hive.dart';

part 'datauser_model.g.dart';

@HiveType(typeId: 1)
class DataUserModel extends HiveObject {
  DataUserModel({required this.username, required this.birth, required this.password});

  @HiveField(0)
  String username;
  @HiveField(1)
  String birth;
  @HiveField(2)
  String password;

  @override
  String toString() {
    return 'DataUserModel{username: $username, birth: $birth, password: $password}';
  }
}
