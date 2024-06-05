// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/menu/normal_user_bottom_nav.dart';
import 'package:page_transition/page_transition.dart';

class AddOTCMedicinePage extends StatefulWidget {
  const AddOTCMedicinePage({super.key});

  @override
  State<AddOTCMedicinePage> createState() => _AddOTCMedicinePageState();
}

class _AddOTCMedicinePageState extends State<AddOTCMedicinePage> {
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
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "GENDER",
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
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      value: 'Male', // Default value
                      onChanged: (String? newValue) {
                        // Handle the gender change
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const NormalUserBottomNav(),
                        ),
                      );
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
