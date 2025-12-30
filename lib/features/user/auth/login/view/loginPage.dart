import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/common%20textfield/widget/commonfield.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/home/view/homepage.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController passwerd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome back",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 63, 76),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Commonfield(
                      text: "Email",
                      hinttext: "Enter email",
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email canot be empty";
                        } else if (!value.contains("@gmail.com")) {
                          return "invalid email";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    Commonfield(
                      text: "passwerd",
                      hinttext: "Enter passwerd",
                      controller: passwerd,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "passwerd canot be empty";
                        } else if (value.length < 6) {
                          return "at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey),
                    ),

                    SizedBox(height: 60),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    Center(
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
