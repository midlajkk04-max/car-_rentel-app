import 'package:hive/hive.dart';

part 'booking_model.g.dart';

@HiveType(typeId: 2)
class BookingModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String carName;

  @HiveField(2)
  final String carImage;

  @HiveField(3)
  final int carPrice;

  @HiveField(4)
  final String bookingDate;

  @HiveField(5)
  final int days;

  @HiveField(6)
  final int totalAmount;

  BookingModel({
    required this.userId,
    required this.carName,
    required this.carImage,
    required this.carPrice,
    required this.bookingDate,
    required this.days,
    required this.totalAmount,
  });
}
