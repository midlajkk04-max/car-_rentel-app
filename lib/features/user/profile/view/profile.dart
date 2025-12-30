import 'package:flutter/material.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/auth/login/view/loginPage.dart';
import 'package:hive_project/features/user/profile/widget/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        title: Text("profile"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile.png"),
              ),
            ),
            SizedBox(height: 15),
            // Text(name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            // Text(name1),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Profilecontainer(
              icon: Icons.person_outlined,
              text: "personal information",
            ),
            Profilecontainer(icon: Icons.history, text: "Rentel History"),
            Profilecontainer(icon: Icons.credit_card, text: "payment Methods"),
            Profilecontainer(icon: Icons.badge, text: "Driver's License"),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "General",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Profilecontainer(icon: Icons.settings, text: "App settings"),
            Profilecontainer(icon: Icons.help_outline, text: "Help & support"),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Loginpage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 244, 21, 5),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Logout", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
