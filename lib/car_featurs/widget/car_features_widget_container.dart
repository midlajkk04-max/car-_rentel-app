import 'package:flutter/material.dart';

class CarFeaturesWidgetCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const CarFeaturesWidgetCard({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFF1E2A38),
       
        elevation: 4, 
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.blueAccent,
                  size: 30,
                ),
              ),
               SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                   SizedBox(height: 4),
                  Text(
                    value,
                    style:  TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
