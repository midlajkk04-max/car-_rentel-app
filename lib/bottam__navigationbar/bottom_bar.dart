import 'package:flutter/material.dart';
import 'package:hive_project/favorite/view/favorite_page.dart';
import '../features/user/home/view/homepage.dart';
import '../features/user/vehicle_search/view/vehicle_search_page.dart';
import '../booking history/booking_historypage.dart';
import '../features/user/profile/view/profile.dart';
import '../features/user/auth/service/user_service.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int indexNum = 0;

  @override
  Widget build(BuildContext context) {
    final user = UserService.getCurrentUser();

    final tabs = [
       HomePage(),
      const VehicleSearchPage(),
      user == null
          ? const Center(child: Text("No User"))
          : BookingHistoryPage(userId: user.id),
      const FavoritesPage(),
      const Profile(),
    ];

    return Scaffold(
      body: tabs[indexNum],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNum,
        onTap: (i) {
          setState(() {
            indexNum = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
