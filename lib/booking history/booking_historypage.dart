import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/booking/model/booking_model.dart';
import 'package:hive_project/booking/service/bokking_service.dart';
import 'package:hive_project/booking/widget/booking%20widget.dart';



class BookingHistoryPage extends StatelessWidget {
  final String userId;

  const BookingHistoryPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final Box bookingBox = Hive.box('bookingBox');

    return Scaffold(
      backgroundColor: const Color(0xFF0F1B24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1B24),
        title: const Text("My Bookings"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: bookingBox.listenable(),
        builder: (context, _, __) {
          // 🔹 USER-WISE BOOKINGS
          final List<BookingModel> bookings =
              BookingService.getBookings(userId);

          if (bookings.isEmpty) {
            return const Center(
              child: Text(
                "No bookings yet",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];

              return BookingCardWidget(
                booking: booking,
                onDelete: () async {
                  await BookingService.deleteBooking(
                    booking.userId,
                    booking.carName,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
