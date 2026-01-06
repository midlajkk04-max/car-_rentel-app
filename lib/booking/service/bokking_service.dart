import 'package:hive/hive.dart';
import '../model/booking_model.dart';

class BookingService {
  static final Box _box = Hive.box('bookingBox');


  static Future<bool> saveBooking(BookingModel booking) async {
    final List stored = _box.get('bookings', defaultValue: []);

    final alreadyBooked = stored.any((e) =>
        e['userId'] == booking.userId &&
        e['carName'] == booking.carName);

    if (alreadyBooked) {
      return false; 
    }

    stored.add(booking.toMap());
    await _box.put('bookings', stored);
    return true; 
  }

  
  static List<BookingModel> getBookings(String userId) {
    final List stored = _box.get('bookings', defaultValue: []);
    return stored
        .map((e) => BookingModel.fromMap(Map<String, dynamic>.from(e)))
        .where((b) => b.userId == userId)
        .toList();
  }

  
  static Future<void> deleteBooking(String userId, String carName) async {
    final List stored = _box.get('bookings', defaultValue: []);
    stored.removeWhere(
      (e) => e['userId'] == userId && e['carName'] == carName,
    );
    await _box.put('bookings', stored);
  }
}
