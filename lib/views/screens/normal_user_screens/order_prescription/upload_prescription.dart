// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPrescriptionScreen extends StatefulWidget {
  const UploadPrescriptionScreen({super.key});

  @override
  State<UploadPrescriptionScreen> createState() =>
      _UploadPrescriptionScreenState();
}

class _UploadPrescriptionScreenState extends State<UploadPrescriptionScreen> {
  List<File> _prescriptions = [];
  List<bool> _selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Upload Prescription",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 27),
          GestureDetector(
            onTap: () async {
              final XFile? image = await ImagePicker().pickImage(
                source: ImageSource.camera,
              );
              if (image != null) {
                setState(() {
                  _prescriptions.add(File(image.path));
                  _selected.add(false);
                });
              }
            },
            child: buildOptionCard(
              icon: "assets/images/camera.png",
              label: "Camera",
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final XFile? image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );
              if (image != null) {
                setState(() {
                  _prescriptions.add(File(image.path));
                  _selected.add(false);
                });
              }
            },
            child: buildOptionCard(
              icon: "assets/images/gallery.png",
              label: "From Gallery",
            ),
          ),
          const Divider(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _prescriptions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: Image.file(_prescriptions[index]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.file(_prescriptions[index]),
                      title: Text('Prescription ${index + 1},  (Tap to View)'),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            _prescriptions.removeAt(index);
                            _selected.removeAt(index);
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.clear_circled,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {},
            child: const Card(
              color: Color.fromARGB(255, 0, 136, 102),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Text(
                  'Proceed To Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildOptionCard({required String icon, required String label}) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 380,
        height: 65,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(icon),
                  size: 24,
                  color: const Color.fromARGB(255, 0, 136, 102),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 136, 102),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
