import 'package:flutter/material.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/home/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController username = TextEditingController();
  TextEditingController passwerd = TextEditingController();

  Future<void> add() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("user", username.text);
    pref.setString("user1", passwerd.text);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

         
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                color: Color.fromARGB(255, 49, 63, 76),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding:  EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: username,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: InputBorder.none,
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: passwerd,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: InputBorder.none,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 60),

                   
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: add,
                        child:  Text(
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
