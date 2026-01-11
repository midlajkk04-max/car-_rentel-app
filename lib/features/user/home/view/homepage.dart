import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/profile/view/profile.dart';
import 'package:hive_project/features/user/vehicle_search/view/vehicle_search_page.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/features/user/auth/service/user_service.dart';

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
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'car rentel',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        
        actions: [
          ValueListenableBuilder(
            valueListenable:
                Hive.box<UserModel>('userBox').listenable(),
            builder: (context, box, _) {
              final user = UserService.getCurrentUser();

              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Profile()),
                  );
                },
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  backgroundImage: user?.imagepath != null
                      ? FileImage(File(user!.imagepath!))
                      : const AssetImage("images/profile.png")
                          as ImageProvider,
                ),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),

      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Find the perfect car',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'for your next trip',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(height: 24),

          
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search brand, model...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: const Color(0xFF2A2A2A),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_today, color: Colors.blue),
                              SizedBox(width: 8),
                              Text('Nov 12, 10:00'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_today, color: Colors.blue),
                              SizedBox(width: 8),
                              Text('Nov 15, 10:00'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VehicleSearchPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Search Available Cars'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            
             Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((cat) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cat['selected'] as bool
                            ? Colors.blue
                            : const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        cat['icon'] as IconData,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat['name'].toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Popular Near You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('View All',
                    style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://wallpapers.com/images/featured/bmw-d942a3zxd8i3uqc8.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star,
                          color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text('4.8',
                          style: TextStyle(color: Colors.white)),
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