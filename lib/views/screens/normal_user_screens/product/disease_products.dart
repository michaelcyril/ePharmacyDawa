// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/component/disease_product_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';
import 'package:provider/provider.dart';

class DiseaseProductPage extends StatefulWidget {
  final diseaseId;
  final diseaseName;

  const DiseaseProductPage({super.key, this.diseaseId, this.diseaseName});

  @override
  State<DiseaseProductPage> createState() => _DiseaseProductPageState();
}

class _DiseaseProductPageState extends State<DiseaseProductPage> {
  var userData;
  @override
  void initState() {
    super.initState();
    setUserData();
    Provider.of<MedicineManagementProvider>(
      context,
      listen: false,
    ).getPrescriptionMedicines(widget.diseaseId);
  }

  var dawa_list = [1, 2, 3, 4];

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
        title: Text(
          "${widget.diseaseName} Medicines",
          style: const TextStyle(
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
                return value.getDiseaseMedicineList.isEmpty
                    ? const Center(child: Text("No Disease Medicines"))
                    : GridView.builder(
                        itemCount: value.getDiseaseMedicineList.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) =>
                            DiseaseProductCardWidget(
                          disease: value.getDiseaseMedicineList[index],
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    productData:
                                        value.getDiseaseMedicineList[index],
                                  ),
                                ));
                          },
                          image: value.getDiseaseMedicineList[index]['name'],
                          title: value.getDiseaseMedicineList[index]['name'],
                          dosage: value.getDiseaseMedicineList[index]['dosage'],
                          price: value.getDiseaseMedicineList[index]['price'],
                          isFavorite: false,
                          userRole: userData == null ? null : userData['role'],
                          updateCartCount: (int) {},
                        ),
                      );
              },
            )),
      ),
    );
  }
}
