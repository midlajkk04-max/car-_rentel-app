import 'package:flutter/material.dart';
import 'package:hive_project/booking/view/booking.dart';
import 'package:hive_project/car_featurs/view/car_features.dart';
import 'package:hive_project/features/user/auth/view/loginPage.dart';
import 'package:hive_project/features/user/home/view/homepage.dart';
import 'package:hive_project/features/user/profile/view/profile.dart';
import 'package:hive_project/features/user/splash/view/splash.dart';
import 'package:hive_project/features/user/vehicle_search/view/vehicle_search_page.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
       theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
    
    );
  }
}