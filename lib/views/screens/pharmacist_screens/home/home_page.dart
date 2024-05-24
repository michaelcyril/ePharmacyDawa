import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/home/component/home_card.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/product/otc_medicines_page.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/product/prescription_medicines_page.dart';

class PharmacistHomePageScreen extends StatefulWidget {
  const PharmacistHomePageScreen({super.key});

  @override
  State<PharmacistHomePageScreen> createState() =>
      _PharmacistHomePageScreenState();
}

class _PharmacistHomePageScreenState extends State<PharmacistHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.withOpacity(0.3),
                    Colors.white.withOpacity(0.3),
                    Colors.indigo.withOpacity(0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.1, 0.5, 0.8],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Welcome Pharmacist\nDashboard',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Positioned(
                    top: 30,
                    right: 5,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/Profile Image.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19,
                    mainAxisExtent: 125,
                    mainAxisSpacing: 19),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PharmacistOtcMedicinesScreen(),
                          ));
                    },
                    title: "OTC Medicine",
                    gradientStartColor: const Color(0xffe8eaf6),
                    gradientEndColor: const Color(0xff00acc1),
                  ),
                  DiscoverSmallCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PharmacistPrescriptionMedicinesPage(),
                          ));
                    },
                    title: "Prescription Medicine",
                    gradientStartColor: const Color(0xffe8eaf6),
                    gradientEndColor: const Color(0xffF6815B),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Order History",
                    gradientStartColor: const Color(0xffe8eaf6),
                    gradientEndColor: const Color(0xffF0B31A),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Order Requests",
                    gradientStartColor: const Color(0xffe8eaf6),
                    gradientEndColor: const Color(0xffe1bee7),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Diseases",
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Others",
                    gradientStartColor: const Color(0xffe8eaf6),
                    gradientEndColor: const Color(0xff90a4ae),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
