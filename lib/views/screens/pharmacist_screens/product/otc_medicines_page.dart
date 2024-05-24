// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/home/component/product_card_widget.dart';

class PharmacistOtcMedicinesScreen extends StatefulWidget {
  const PharmacistOtcMedicinesScreen({super.key});

  @override
  State<PharmacistOtcMedicinesScreen> createState() =>
      _PharmacistOtcMedicinesScreenScreenState();
}

class _PharmacistOtcMedicinesScreenScreenState
    extends State<PharmacistOtcMedicinesScreen> {
  var dawa_list = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTC Medicines",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.3),
                Colors.white.withOpacity(0.3),
                Colors.indigo.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: GridView.builder(
            itemCount: dawa_list.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ProductCardWidget(
              onPress: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const ProductDetailsScreen(),
                //     ));
              },
              image: "assets/images/dawa1.png",
              title: "Panadol",
              dosage: "400mg",
              price: "200",
              isFavorite: false,
              updateCartCount: (int) {},
              addToFavorites: () {},
            ),
          ),
        ),
      ),
    );
  }
}
