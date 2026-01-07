import 'package:flutter/material.dart';
import '../features/user/home/view/homepage.dart';
import '../features/user/vehicle_search/view/vehicle_search_page.dart';
import '../booking history/booking_historypage.dart';
import '../favorite/view/favorite_page';
import '../features/user/profile/view/profile.dart';
import '../features/user/auth/service/user_service.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int indexNum = 0;

  late String userId;
  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    final user = UserService.getCurrentUser();
    userId = user!.email;

    tabs = [
      HomePage(),
      VehicleSearchPage(),
      BookingHistoryPage(userId: userId),
      FavoritesPage(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: indexNum, children: tabs),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNum,
        onTap: (i) => setState(() => indexNum = i),
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