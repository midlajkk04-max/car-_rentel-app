import 'package:hive/hive.dart';
import '../model/user_model.dart';

class UserService {
  static final Box<UserModel> userBox =
      Hive.box<UserModel>('userBox');

  static Future<void> saveUser(UserModel user) async {
    await userBox.put('currentUser', user);
  }

  static UserModel? getUser() {
    return userBox.get('currentUser');
  }

    static Future<void> deleteUser() async {
    await userBox.delete('currentUser');
  }
}
