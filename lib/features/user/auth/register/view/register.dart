import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/common%20textfield/widget/commonfield.dart';
import 'package:hive_project/features/user/auth/login/view/loginPage.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/features/user/home/view/homepage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  final Box<UserModel> userBox = Hive.box<UserModel>('userBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Create an account",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 63, 76),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding:  EdgeInsets.all(30),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Commonfield(
                        text: "Name",
                        hinttext: "Enter name",
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      Commonfield(
                        text: "Email",
                        hinttext: "Enter email",
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          } else if (!value.contains("@gmail.com")) {
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      Commonfield(
                        text: "Password",
                        hinttext: "Enter password",
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "At least 6 characters";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 50),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              UserModel user = UserModel(
                                name: username.text,
                                email: email.text,
                                password: password.text,
                              );

                  
                              await userBox.put('currentUser', user);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Registration Successful"),
                                ),
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomBar(),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Center(
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
