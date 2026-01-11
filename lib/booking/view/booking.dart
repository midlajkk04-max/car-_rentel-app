import 'package:flutter/material.dart';
import 'package:hive_project/booking/service/bokking_service.dart';
import 'package:hive_project/booking/view/booking_succespage.dart';
import '../model/booking_model.dart';
import '../../features/user/auth/service/user_service.dart';

class BookingPage extends StatefulWidget {
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
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? startDate;
  DateTime? endDate;

  int get days {
    if (startDate == null || endDate == null) return 0;
    return endDate!.difference(startDate!).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    final user = UserService.getCurrentUser();
    if (user == null) {
      return const Scaffold(body: Center(child: Text("No user found")));
    }

    final int pricePerDay =
        int.tryParse(widget.carPrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

    final int total = pricePerDay * days;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1B24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1B24),
        title: const Text("Booking Summary"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(widget.carImage, height: 200, fit: BoxFit.cover),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(child: _dateBox("Start Date", startDate, true)),
                const SizedBox(width: 10),
                Expanded(child: _dateBox("End Date", endDate, false)),
              ],
            ),

            const SizedBox(height: 16),

            _row("Days", "$days"),
            _row("Price / day", "₹$pricePerDay"),
            _row("Total", "₹$total", bold: true),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () async {
                if (startDate == null || endDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Select dates")),
                  );
                  return;
                }

                final booking = BookingModel(
                  userId: user.id,
                  carName: widget.carName,
                  carImage: widget.carImage,
                  carPrice: pricePerDay,
                  bookingDate: DateTime.now().toIso8601String(),
                  days: days,
                  totalAmount: total,
                  startDate: startDate!.toIso8601String(),
                  endDate: endDate!.toIso8601String(),
                );

                final success = await BookingService.saveBooking(booking);

                if (!success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Already booked")),
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

  Widget _dateBox(String title, DateTime? date, bool isStart) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (picked != null) {
          setState(() {
            if (isStart) {
              startDate = picked;
              endDate = null;
            } else {
              endDate = picked;
            }
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C2630),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            Text(
              date == null ? "Select" : date.toString().split(' ').first,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
