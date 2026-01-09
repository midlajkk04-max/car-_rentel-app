class BookingModel {
  final String userId;
  final String carName;
  final String carImage;
  final String carPrice;
  final String bookingDate;
  final int days;
  final String totalAmount;

  BookingModel({
    required this.userId,
    required this.carName,
    required this.carImage,
    required this.carPrice,
    required this.bookingDate,
    required this.days,
    required this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'carName': carName,
      'carImage': carImage,
      'carPrice': carPrice,
      'bookingDate': bookingDate,
      'days': days,
      'totalAmount': totalAmount,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      userId: map['userId'] ?? '',
      carName: map['carName'] ?? '',
      carImage: map['carImage'] ?? '',
      carPrice: map['carPrice'] ?? '',
      bookingDate: map['bookingDate'] ?? '',
      days: map['days'] ?? 0,
      totalAmount: map['totalAmount'] ?? '',
    );
  }
}