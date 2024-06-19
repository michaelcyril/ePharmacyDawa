// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/component/disease_product_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';
import 'package:provider/provider.dart';

class DiseaseProductPage extends StatefulWidget {
  final diseaseId;
  const DiseaseProductPage({super.key, this.diseaseId});

  @override
  State<DiseaseProductPage> createState() => _DiseaseProductPageState();
}

class _DiseaseProductPageState extends State<DiseaseProductPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MedicineManagementProvider>(
      context,
      listen: false,
    ).getPrescriptionMedicines(widget.diseaseId);
  }

  var dawa_list = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Disease Medicines",
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
                return value.getDiseaseMedicineList.isEmpty
                    ? const Center(child: Text("No Otc Medicines"))
                    : GridView.builder(
                        itemCount: dawa_list.length,
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
                          image: "assets/images/dawa1.png",
                          title: "Panadol",
                          dosage: "400mg",
                          price: "200",
                          isFavorite: false,
                        ),
                      );
              },
            )),
      ),
    );
  }
}
