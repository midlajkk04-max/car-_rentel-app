import 'package:flutter/material.dart';
import 'package:hive_project/booking/service/bokking_service.dart';
import 'package:hive_project/booking/view/booking_succespage.dart';
import '../model/booking_model.dart';

class BookingPage extends StatelessWidget {
  final String carName;
  final String carImage;
  final String carPrice;
  final String userId;

  const BookingPage({
    super.key,
    required this.carName,
    required this.carImage,
    required this.carPrice,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
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
                  _row("Price / day", carPrice),
                  _row("Days", "3"),
                  const Divider(color: Colors.grey),
                  _row("Total", carPrice,
                      bold: true, color: Colors.blueAccent),
                ],
              ),
            ),

            const Spacer(),

          
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () async {
                BookingModel booking = BookingModel(
                  userId: userId,
                  carName: carName,
                  carImage: carImage,
                  carPrice: carPrice,
                  bookingDate: DateTime.now().toString(),
                  days: 3,
                  totalAmount: carPrice,
                );

                final success =
                    await BookingService.saveBooking(booking);

                if (!context.mounted) return;

              
                if (!success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("You already booked this car"),
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
              child: const Text(
                "Confirm Booking",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value,
      {bool bold = false, Color color = Colors.white}) {
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