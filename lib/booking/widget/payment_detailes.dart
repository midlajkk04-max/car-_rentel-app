import 'package:flutter/material.dart';

class PaymentDetailes extends StatelessWidget {
  final String text ;
  final String text1;

  const PaymentDetailes({super.key,
   required this.text,
   required this.text1,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text,style: TextStyle(color: Colors.grey),),
        ),
        Spacer(),
        Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text1,style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}