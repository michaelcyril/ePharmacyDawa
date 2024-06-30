// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/cart_management_provider.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/home/component/product_card_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/product/add_otc_medicine.dart';
import 'package:provider/provider.dart';

class PharmacistOtcMedicinesScreen extends StatefulWidget {
  const PharmacistOtcMedicinesScreen({super.key});

  @override
  State<PharmacistOtcMedicinesScreen> createState() =>
      _PharmacistOtcMedicinesScreenScreenState();
}

class _PharmacistOtcMedicinesScreenScreenState
    extends State<PharmacistOtcMedicinesScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<MedicineManagementProvider>(
      context,
      listen: false,
    ).getOtcMedicines();
  }

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
            child: Consumer<MedicineManagementProvider>(
              builder: (context, value, child) {
                return value.getOtcMedicineList.isEmpty
                    ? const Center(child: Text("No Otc Medicines"))
                    : GridView.builder(
                        itemCount: value.getOtcMedicineList.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) => ProductCardWidget(
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    productData:
                                        value.getOtcMedicineList[index],
                                  ),
                                ));
                          },
                          image: value.getOtcMedicineList[index]['image'],
                          title: value.getOtcMedicineList[index]['name'],
                          dosage: value.getOtcMedicineList[index]['dosage'],
                          price: value.getOtcMedicineList[index]['price'],
                          isFavorite: false,
                          updateCartCount: (int) {
                            Provider.of<CartManagementProvider>(
                              context,
                              listen: false,
                            ).addItem(value.getOtcMedicineList[index]);
                          },
                          addToFavorites: () {},
                        ),
                      );
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.withOpacity(0.3),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddOTCMedicinePage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
