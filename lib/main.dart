import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/booking/model/booking_model.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/features/user/splash/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  
  if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(UserModelAdapter());
  if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(BookingModelAdapter());

  
  await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<BookingModel>('bookingBox');
  await Hive.openBox('appBox');
  await Hive.openBox('favoriteBox');
  await Hive.openBox('documentsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const Splash(),
    );
  }
}
