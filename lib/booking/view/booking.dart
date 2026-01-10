import 'package:flutter/material.dart';
import 'package:hive_project/booking/service/bokking_service.dart';
import 'package:hive_project/booking/view/booking_succespage.dart';
import '../model/booking_model.dart';
import '../../features/user/auth/service/user_service.dart';

class BookingPage extends StatelessWidget {
  final String carName;
  final String carImage;
  final String carPrice;

  const BookingPage({
    super.key,
    required this.carName,
    required this.carImage,
    required this.carPrice, required String userId,
  });

  @override
  Widget build(BuildContext context) {
    final user = UserService.getCurrentUser();
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("No user found")),
      );
    }

    final int pricePerDay =
        int.tryParse(carPrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    const int days = 3;
    final int total = pricePerDay * days;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1B24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1B24),
        title: const Text("Booking Summary"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                carImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1C2630),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _row("Car", carName),
                  _row("Price / day", "₹$pricePerDay"),
                  _row("Days", "$days"),
                  const Divider(color: Colors.grey),
                  _row(
                    "Total",
                    "₹$total",
                    bold: true,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              onPressed: () async {
                final booking = BookingModel(
                  userId: user.id,
                  carName: carName,
                  carImage: carImage,
                  carPrice: pricePerDay,
                  bookingDate: DateTime.now().toIso8601String(),
                  days: days,
                  totalAmount: total,
                );

                final success = await BookingService.saveBooking(booking);

                if (!context.mounted) return;

                if (!success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Already booked"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BookingSuccessPage(),
                  ),
                );
              },
              child: const Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(
    String title,
    String value, {
    bool bold = false,
    Color color = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
