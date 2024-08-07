// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/home/component/product_card_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/product/add_prescription_medicine.dart';
import 'package:provider/provider.dart';

class PharmacistPrescriptionMedicinesPage extends StatefulWidget {
  const PharmacistPrescriptionMedicinesPage({super.key});

  @override
  State<PharmacistPrescriptionMedicinesPage> createState() =>
      _PharmacistPrescriptionMedicinesPageState();
}

class _PharmacistPrescriptionMedicinesPageState
    extends State<PharmacistPrescriptionMedicinesPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<MedicineManagementProvider>(
      context,
      listen: false,
    ).getAllPrescriptionMedicines();
  }
  var dawa_list = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prescription Medicines",
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
                return value.getAllPrescriptionMedicineList.isEmpty
                    ? const Center(child: Text("No Prescription Medicines"))
                    : GridView.builder(
                        itemCount: value.getAllPrescriptionMedicineList.length,
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
                                  builder: (context) =>
                                      ProductDetailsScreen(productData: value.getAllPrescriptionMedicineList[index],),
                                ));
                          },
                          image: value.getAllPrescriptionMedicineList[index]['image'],
                          title: value.getAllPrescriptionMedicineList[index]['name'],
                          dosage: value.getAllPrescriptionMedicineList[index]['dosage'],
                          price: value.getAllPrescriptionMedicineList[index]['price'],
                          isFavorite: false,
                          updateCartCount: (int) {},
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
                builder: (context) => const AddPrescriptionMedicinePage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
