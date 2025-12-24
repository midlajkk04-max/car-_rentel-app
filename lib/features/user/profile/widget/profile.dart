import 'package:flutter/material.dart';

class Profilecontainer extends StatelessWidget {
 final IconData icon;
 final String text;


  const Profilecontainer({super.key,
  required this.icon,
  required this.text,
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color(0xFF1C2B36),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 28,),
            Text(text),
           Spacer(),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}