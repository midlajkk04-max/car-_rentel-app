import 'package:hive/hive.dart';
import '../model/user_model.dart';

class UserService {
  static final Box<UserModel> userBox = Hive.box<UserModel>('userBox');

  static UserModel? _currentUser;

  static UserModel? getCurrentUser() {
    if (_currentUser != null) return _currentUser;
    if (userBox.isNotEmpty) _currentUser = userBox.values.last;
    return _currentUser;
  }

  static Future<void> setCurrentUser(UserModel user) async {
    _currentUser = user;

    final index = userBox.values.toList().indexWhere((u) => u.id == user.id);
    if (index != -1) {
      await userBox.putAt(index, user);
    } else {
      await userBox.add(user);
    }
  }

  static Future<String?> registerUser(UserModel user) async {
    if (userBox.values.any((u) => u.email == user.email)) {
      return "Email already exists";
    }

    await setCurrentUser(user);
    return null;
  }

  static UserModel? loginUser(String email, String password) {
    final matchingUsers = userBox.values
        .where((u) => u.email == email && u.password == password)
        .toList();

    if (matchingUsers.isEmpty) return null;

    _currentUser = matchingUsers.first;
    return matchingUsers.first;
  }

  static Future<void> updateCurrentUser(UserModel updatedUser) async {
    final index = userBox.values.toList().indexWhere(
      (u) => u.id == updatedUser.id,
    );

    if (index != -1) {
      await userBox.putAt(index, updatedUser);
    } else {
      await userBox.add(updatedUser);
    }

    _currentUser = updatedUser;
  }

  static Future<void> logout() async {
    _currentUser = null;
  }
}
