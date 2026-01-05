import 'package:hive/hive.dart';

class UserStorage {
  static final Box _box = Hive.box('appBox'); 

  
  static Future<void> save(String keyPrefix, String userEmail, dynamic data) async {
    String key = '${keyPrefix}_$userEmail';
    await _box.put(key, data);
  }


  static dynamic get(String keyPrefix, String userEmail, {dynamic defaultValue}) {
    String key = '${keyPrefix}_$userEmail';
    return _box.get(key, defaultValue: defaultValue);
  }

  
  static Future<void> delete(String keyPrefix, String userEmail) async {
    String key = '${keyPrefix}_$userEmail';
    await _box.delete(key);
  }
}
