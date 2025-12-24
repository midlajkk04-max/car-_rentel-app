import 'package:flutter/material.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/auth/view/loginPage.dart';
import 'package:hive_project/features/user/profile/widget/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future <void> logout()async{
   final log =await SharedPreferences.getInstance();
   log.clear();
   Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
  }
 String name ="";
 String name1 ="";

  @override
  void initState(){
    super.initState();
    show();
  }

  Future <void> show()async{
    final sh =await SharedPreferences.getInstance();
    

   setState(() {
     name = sh.getString("user")??"";
    name1 = sh .getString("user1")??"";
   });

  }
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
            SizedBox(height: 10,),
            Center(
              child: CircleAvatar(
                radius: 50,
               backgroundImage: AssetImage("images/profile.png"),
                
                
              ),
              
            ),
            SizedBox(height: 15,),
            Text(name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            // Text(name1),
           Row(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25),
                 child: Text("Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ),
             ],
           ),
            Profilecontainer(icon: Icons.person_outlined, text: "personal information"),
             Profilecontainer(icon: Icons.history, text: "Rentel History"),
              Profilecontainer(icon: Icons.credit_card, text: "payment Methods"),
               Profilecontainer(icon: Icons.badge, text: "Driver's License"),

               Row(
                 children: [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 25),
                     child: Text("General",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   ),
                 ],
               ),
                Profilecontainer(icon: Icons.settings, text: "App settings"),
                 Profilecontainer(icon: Icons.help_outline, text: "Help & support"),
            SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(onPressed: (){
                  logout();
                },style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 244, 21, 5),
                minimumSize: Size(double.infinity, 50)
                ), child: Text("Logout",style: TextStyle(color: Colors.white),)),
              )
          ],
        ),
      ),
    );
  }
}