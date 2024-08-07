// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/disease_management_provider.dart';
import 'package:provider/provider.dart';

class AddDiseasePage extends StatefulWidget {
  const AddDiseasePage({super.key});

  @override
  State<AddDiseasePage> createState() => _AddDiseasePageState();
}

class _AddDiseasePageState extends State<AddDiseasePage> {
  TextEditingController nameController = TextEditingController();

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
                      "Please Add \nDisease",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                        hintText: "Enter Disease Name",
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
                      };
                      print(data);
                      Map<String, dynamic> res =
                          await Provider.of<DiseaseManagementProvider>(context,
                                  listen: false)
                              .addDisease(data);
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
                      "Add Disease",
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
