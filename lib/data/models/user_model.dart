import 'package:hive/hive.dart';
import 'package:machine_test_geeksynergy/resources/profession_enum.dart';
part 'user_model.g.dart';  

@HiveType(typeId: 0)  // Give your class a unique typeId
class UserModel extends HiveObject {
  @HiveField(0)
  final String? userName;

  @HiveField(1)
  final String userEmail;

  @HiveField(2)
  final String? phoneNumber;

  @HiveField(3)
  final String? userPassword;

  @HiveField(4)
  final UserProfession? userProfession;  

  UserModel({
    this.userName,
    required this.userEmail,
    this.phoneNumber,
    this.userPassword,
    this.userProfession,
  });
}



