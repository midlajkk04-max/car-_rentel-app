import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/common%20textfield/widget/commonfield.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/features/user/auth/register/view/register.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Box<UserModel> userBox = Hive.box<UserModel>('userBox');

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 63, 76),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Commonfield(
                        text: "Email",
                        hinttext: "Enter email",
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email cannot be empty";
                          } else if (!value.contains("@gmail.com")) {
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

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

                      const SizedBox(height: 60),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                            
                              UserModel? savedUser =
                                  userBox.get('currentUser');

                              if (savedUser == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("No user found. Please register."),
                                  ),
                                );
                                return;
                              }

                            
                              if (email.text == savedUser.email &&
                                  password.text == savedUser.password) {
                                // ✅ Login success
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomBar(),
                                  ),
                                );
                              } else {
                                // ❌ Wrong credentials
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Invalid email or password"),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                       SizedBox(height: 25),

                     Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 42),
                          child: Row(
                            
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Registerpage()));
                              }, child: Text("sign in"))
                            ],
                          ),
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
