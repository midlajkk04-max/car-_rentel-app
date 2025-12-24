import 'package:flutter/material.dart';
import 'package:hive_project/core/constants/app_colors.dart';

class Container3 extends StatelessWidget {
  final IconData icon;
  final String text;
  const Container3({super.key,
   required this.icon,
   required this.text,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
         color: AppColors.backGround,
        borderRadius: BorderRadius.circular(20)
         
      ),
    
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 13,),
          Text(text)
        ],
       ),
     ),
      
    );
  }
}