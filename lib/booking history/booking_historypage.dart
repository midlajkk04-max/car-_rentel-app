import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/booking/model/booking_model.dart';
import 'package:hive_project/booking/widget/booking%20widget.dart';



class BookingHistoryPage extends StatelessWidget {
  final String userId;

  const BookingHistoryPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<BookingModel>('bookingBox');

    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<BookingModel> box, _) {
          final bookings = box.values.where((b) => b.userId == userId).toList();

          if (bookings.isEmpty) return const Center(child: Text("No bookings yet"));

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final b = bookings[index];
              return BookingCardWidget(
                booking: b,
                onDelete: () async {
                  final idx = box.values.toList().indexOf(b);
                  if (idx != -1) await box.deleteAt(idx);
                },
              );
            },
          );
        },
      ),
    );
  }
}
