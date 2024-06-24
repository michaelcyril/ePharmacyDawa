// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables, empty_catches, use_build_context_synchronously, unused_local_variable, unused_import

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_colors.dart';
import 'package:flutter_project_template/providers/disease_management_provider.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddOTCMedicinePage extends StatefulWidget {
  const AddOTCMedicinePage({super.key});

  @override
  State<AddOTCMedicinePage> createState() => _AddOTCMedicinePageState();
}

class _AddOTCMedicinePageState extends State<AddOTCMedicinePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String? choosenDisease;
  var deseaseList;
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;

  openImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      if (pickedfile != null) {
        setState(() {
          imagefile = pickedfile;
        });
      } else {}
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getDesease();
  }

  getDesease() {
    Provider.of<DiseaseManagementProvider>(
      context,
      listen: false,
    ).getDiseases();

    setState(() {
      deseaseList =
          Provider.of<DiseaseManagementProvider>(context, listen: false)
              .getDiseaseList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 0,
                ),
                Center(
                  child: GestureDetector(
                    child: const Text(
                      "Please Add Otc Medicine\nhere",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "NAME",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Enter Product Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  elevation: 0,
                  color: AppColors.primaryColor,
                  height: 50,
                  minWidth: 500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    openImages();
                  },
                  child: const Text(
                    'Upload Images',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                imagefile != null
                    ? Card(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(File(imagefile!.path)),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 5),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "DESCRIPTION",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Enter Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "DOSAGE",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      controller: dosageController,
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Enter Dosage",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "PRICE",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Enter Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      var data = {
                        "name": nameController.text,
                        "description": descriptionController.text,
                        "dosage": dosageController.text,
                        "type": "OTC",
                        "price": priceController.text,
                        // "image": await MultipartFile.fromFile(imagefile!.path),
                      };
                      Map<String, dynamic> res =
                          await Provider.of<MedicineManagementProvider>(context,
                                  listen: false)
                              .addMedicine(data);
                      if (res['save']) {
                        Navigator.pop(context);
                      } else {
                        SnackBar(
                          content: Text(res['message']),
                          duration: const Duration(seconds: 3),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 190, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Add Product",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
