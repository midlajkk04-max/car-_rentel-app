import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/profile/view/profile.dart';
import 'package:hive_project/features/user/vehicle_search/view/vehicle_search_page.dart';
import 'package:hive_project/main.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  final categories = [
    {'name': 'Luxury', 'icon': Icons.diamond, 'selected': false},
    {'name': 'SUV', 'icon': Icons.directions_car, 'selected': false},
    {'name': 'Sports', 'icon': Icons.speed, 'selected': false},
    {'name': 'Electric', 'icon': Icons.bolt, 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('car rentel', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
          }, icon: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person),
          )),
          SizedBox(width: 16),
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Find the perfect car',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'for your next trip',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 24),

            
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search brand, model...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color(0xFF2A2A2A),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.blue),
                              SizedBox(width: 8),
                              Text('Nov 12, 10:00'),
                            ],
                          ),
                        ),
                      ),
                     SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.blue),
                              SizedBox(width: 8),
                              Text('Nov 15, 10:00'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        bottomBarKey.currentState?.changeIndex(1); 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text('Search Available Cars'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            
            Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((cat) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cat['selected'] as bool
                            ? Colors.blue
                            : Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        cat['icon'] as IconData?,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      cat['name'].toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              }).toList(),
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Near You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('View All', style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage('https://wallpapers.com/images/featured/bmw-d942a3zxd8i3uqc8.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text('4.8', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}
