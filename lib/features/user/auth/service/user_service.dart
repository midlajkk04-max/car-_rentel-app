import 'package:hive/hive.dart';
import '../model/user_model.dart';

class UserService {
  static final Box<UserModel> _box = Hive.box<UserModel>('userBox');

  static const String _currentUserKey = 'currentUser';

  
  static Future<String?> registerUser(UserModel user) async {
    if (_box.containsKey(user.email)) {
      return "User already exists";
    }
    await _box.put(user.email, user);
    return null;
  }

  
  static UserModel? loginUser(String email, String password) {
    final user = _box.get(email);

    if (user != null && user.password == password) {
      _box.put(_currentUserKey, user);
      return user;
    }
    return null;
  }

  
  static UserModel? getCurrentUser() {
    return _box.get(_currentUserKey);
  }

  
  static Future<void> updateCurrentUser(UserModel updatedUser) async {
    final current = getCurrentUser();
    if (current == null) return;

    
    if (current.email != updatedUser.email) {
      await _box.delete(current.email);
    }

    await _box.put(updatedUser.email, updatedUser);
    await _box.put(_currentUserKey, updatedUser);
  }

  
  static Future<void> logout() async {
    await _box.delete(_currentUserKey);
  }
}
