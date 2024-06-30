// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/component/disease_product_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';
import 'package:provider/provider.dart';

class OtcProductsScreen extends StatefulWidget {
  const OtcProductsScreen({super.key});

  @override
  State<OtcProductsScreen> createState() => _OtcProductsScreenState();
}

class _OtcProductsScreenState extends State<OtcProductsScreen> {
  var dawa_list = [1, 2, 3, 4];
  var userData;
  @override
  void initState() {
    super.initState();
    setUserData();
    Provider.of<MedicineManagementProvider>(
      context,
      listen: false,
    ).getOtcMedicines();
  }

  setUserData() {
    var data =
        Provider.of<UserManagementProvider>(context, listen: false).getUserData;
    setState(() {
      userData = data;
    });
  }

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
                        itemBuilder: (context, index) =>
                            DiseaseProductCardWidget(
                          disease: value.getOtcMedicineList[index],
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
                          userRole: userData['role'],
                          updateCartCount: (int) {},
                        ),
                      );
              },
            )),
      ),
    );
  }
}
