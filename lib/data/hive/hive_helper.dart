import 'package:dart_either/dart_either.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:machine_test_geeksynergy/data/models/user_model.dart';
import 'package:machine_test_geeksynergy/resources/profession_enum.dart';
import 'dart:developer' as developer;

class HiveHelper {
  static final HiveHelper _instance = HiveHelper._internal();

  factory HiveHelper() {
    return _instance;
  }

  HiveHelper._internal();

  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(UserProfessionAdapter());

    await Hive.openBox<UserModel>('usersBox');
    await Hive.openBox<bool>('auth');
  }

  // Close Hive when not in use
  Future<void> closeHive() async {
    await Hive.close();
  }

Future<Either<String, UserModel>> addUser(UserModel userModel) async {
  var box = Hive.box<UserModel>('usersBox');

  final existingUser = box.values.firstWhere(
    (user) => user.userEmail == userModel.userEmail,
    orElse: () => UserModel(userEmail: '', userPassword: '', userName: ''), // Returning a default UserModel
  );

  if (existingUser.userEmail.isEmpty) { // Check if the returned user is a default user
    await box.add(userModel);
    developer.log('User added to Hive: ${userModel.userEmail}');
    return Right(userModel); // Return the added user as a success result
  } else {
    developer.log('User already exists in Hive: ${existingUser.userEmail}');
    return Left('User already exists in Hive'); // Return an error message
  }
}

  List<UserModel> getUsers() {
    var box = Hive.box<UserModel>('usersBox');
    return box.values.toList();
  }

   bool authenticateUser(String email, String password) {
    var box = Hive.box<UserModel>('usersBox');
    for (var user in box.values) {
      if (user.userEmail == email && user.userPassword == password) {
        return true;
      }
    }
    return false; 
  }

  Future<void> setUserSignedIn(bool isSignedIn)async{
    var box=Hive.box<bool>('auth');
    await box.put('isSigned', isSignedIn);
  }

  bool isUserSignedIn(){
    var box=Hive.box<bool>('auth');
    return box.get('isSigned',defaultValue: false) as bool;
  }
}
