import 'package:flutter/material.dart';

class Commonfield extends StatelessWidget {
  final String text;
  final String hinttext;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obsecureValue;
  

  const Commonfield({
    super.key,
    required this.text,
    required this.hinttext,
    required this.controller,
    this.validator,
    this.obsecureValue = false, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,      
      obscureText: obsecureValue, 
      decoration: InputDecoration(
        labelText: text,
        hintText: hinttext,
      ),
    );
  }
}
