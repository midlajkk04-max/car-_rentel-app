import 'package:flutter/material.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/auth/view/loginPage.dart';
import 'package:hive_project/features/user/home/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Future<void> checkUser() async {
      await Future.delayed(const Duration(seconds: 3));
      final check = await SharedPreferences.getInstance();
      final String? user = check.getString("user");

      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginpage()),
        );
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomBar()));
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
        child: Center(child: Image.asset('images/splash.png')),
      ),
    );
  }
}
