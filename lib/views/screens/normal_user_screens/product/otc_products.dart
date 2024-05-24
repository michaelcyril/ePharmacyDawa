// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/component/disease_product_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';

class OtcProductsScreen extends StatefulWidget {
  const OtcProductsScreen({super.key});

  @override
  State<OtcProductsScreen> createState() => _OtcProductsScreenState();
}

class _OtcProductsScreenState extends State<OtcProductsScreen> {
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
            itemBuilder: (context, index) => DiseaseProductCardWidget(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen(),
                    ));
              },
              image: "assets/images/dawa1.png",
              title: "Panadol",
              dosage: "400mg",
              price: "200",
              isFavorite: false,
            ),
          ),
        ),
      ),
    );
  }
}
