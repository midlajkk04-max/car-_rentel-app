import 'package:flutter/material.dart';

class CarFeaturesWidget extends StatelessWidget {
  final String images;
  
   CarFeaturesWidget({super.key,
   required this.images,
   
  });

  @override
  Widget build(BuildContext context) {
     return Row(
      children: [
         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 2),
           child: Container(
            width: 355,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(images),
                fit: BoxFit.cover, 
              ),
            ),
            ),
         ),
      ],
     );
    
  }
}


