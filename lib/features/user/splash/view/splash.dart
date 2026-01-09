import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/features/user/auth/login/view/loginPage.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/auth/register/view/register.dart';
import 'package:hive_project/features/user/auth/service/user_service.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    checkUser();
  }

 void checkUser() async {
  await Future.delayed(const Duration(seconds: 3));

  final user = UserService.getCurrentUser();

  if (!mounted) return;

  if (user != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomBar()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Loginpage()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backGround, AppColors.backGround1],
          ),
        ),
        child: Center(
          child: Image.asset('images/splash.png'),
        ),
      ),
    );
  }
}