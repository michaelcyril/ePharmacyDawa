import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/home/home_page.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/order_page.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/profile/profile_page.dart';

class NormalUserBottomNav extends StatefulWidget {
  const NormalUserBottomNav({super.key});

  @override
  State<NormalUserBottomNav> createState() => _NormalUserBottomNavState();
}

class _NormalUserBottomNavState extends State<NormalUserBottomNav> {
  int index = 0;
  final screens = [
    const HomePageNormalUserScreen(),
    const OrderPageScreen(),
    const Text("1"),
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
              icon: Icon(CupertinoIcons.bag),
              selectedIcon: Icon(CupertinoIcons.bag_fill),
              label: 'Orders',
            ),
            // NavigationDestination(
            //   icon: Icon(CupertinoIcons.heart),
            //   selectedIcon: Icon(CupertinoIcons.heart_fill),
            //   label: 'Wishlist',
            // ),
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
