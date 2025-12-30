import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/features/user/splash/view/splash.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/features/user/auth/register/view/register.dart';


final GlobalKey<BottomBarState> bottomBarKey = GlobalKey<BottomBarState>();

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("usersBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Splash(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor:  Color(0xFF121212),
      ),
    );
  }
}
