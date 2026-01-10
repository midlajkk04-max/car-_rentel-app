import 'package:hive/hive.dart';
import '../model/booking_model.dart';

class BookingService {
  static final Box<BookingModel> bookingBox =
      Hive.box<BookingModel>('bookingBox');

  static Future<bool> saveBooking(BookingModel booking) async {
    final exists = bookingBox.values.any(
      (b) => b.userId == booking.userId && b.carName == booking.carName,
    );
    if (exists) return false;

    await bookingBox.add(booking);
    return true;
  }

  static List<BookingModel> getBookings(String userId) {
    return bookingBox.values.where((b) => b.userId == userId).toList();
  }

  static Future<void> deleteBooking(String userId, String carName) async {
    final idx = bookingBox.values.toList().indexWhere(
      (b) => b.userId == userId && b.carName == carName,
    );
    if (idx != -1) await bookingBox.deleteAt(idx);
  }
}
