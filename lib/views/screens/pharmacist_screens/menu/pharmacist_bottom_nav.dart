import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/profile/profile_page.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/home/home_page.dart';

class PharmacistBottomNav extends StatefulWidget {
  const PharmacistBottomNav({super.key});

  @override
  State<PharmacistBottomNav> createState() => _PharmacistBottomNavBottomNavState();
}

class _PharmacistBottomNavBottomNavState extends State<PharmacistBottomNav> {
  int index = 0;
  final screens = [
    const PharmacistHomePageScreen(),
    const Text(""),
    const ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.teal[100],
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(CupertinoIcons.house),
              selectedIcon: Icon(CupertinoIcons.house_fill),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.captions_bubble),
              selectedIcon: Icon(CupertinoIcons.captions_bubble_fill),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.person),
              selectedIcon: Icon(CupertinoIcons.person_fill),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
