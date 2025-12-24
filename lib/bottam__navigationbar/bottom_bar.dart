import 'package:flutter/material.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/home/view/homepage.dart';
import 'package:hive_project/features/user/profile/view/profile.dart';
import 'package:hive_project/features/user/vehicle_search/view/vehicle_search_page.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int indexNum = 0;

  final List<Widget> tabWidgets = [
    HomePage(),
    VehicleSearchPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: tabWidgets[indexNum],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNum,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.backGround1,
        onTap: (index) {
          setState(() {
            indexNum = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
