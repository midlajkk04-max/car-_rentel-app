import 'package:hive/hive.dart';
import 'package:hive_project/features/user/auth/service/user_service.dart';
import 'package:hive_project/features/user/vehicle_search/model/car_card_model.dart';

class FavoriteService {
  static final Box _box = Hive.box('favoriteBox');

  static String _userKey() {
    return UserService.getCurrentUser()!.id;
  }

  static List<CarModel> getFavorites() {
    final List stored = _box.get(_userKey(), defaultValue: []);
    return stored
        .map((e) => CarModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  static bool isFavorite(CarModel car) {
    final List stored = _box.get(_userKey(), defaultValue: []);
    return stored.any((e) => e['name'] == car.name);
  }

  static Future<void> addFavorite(CarModel car) async {
    final List stored = _box.get(_userKey(), defaultValue: []);
    if (!stored.any((e) => e['name'] == car.name)) {
      stored.add(car.toMap());
      await _box.put(_userKey(), stored);
    }
  }

  static Future<void> removeFavorite(String carName) async {
    final List stored = _box.get(_userKey(), defaultValue: []);
    stored.removeWhere((e) => e['name'] == carName);
    await _box.put(_userKey(), stored);
  }
}
