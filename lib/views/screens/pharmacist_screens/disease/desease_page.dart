import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/disease_management_provider.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/disease/add_desease_page.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/disease/component/disease_widget.dart';
import 'package:provider/provider.dart';

class DiseasePageScreen extends StatefulWidget {
  const DiseasePageScreen({super.key});

  @override
  State<DiseasePageScreen> createState() => _DiseasePageScreenState();
}

class _DiseasePageScreenState extends State<DiseasePageScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<DiseaseManagementProvider>(
      context,
      listen: false,
    ).getDiseases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Diseases",
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
      body: Consumer<DiseaseManagementProvider>(
        builder: (context, value, child) {
          return value.getDiseaseList.isEmpty
              ? const Center(child: Text("No Order History"))
              : ListView(
                  children: value.getDiseaseList
                      .map<Widget>(
                        (e) => DiseaseWidgetCard(
                          image: "assets/images/dengue.jpg",
                          category: e['name'],
                          numOfMeds: 18,
                        ),
                      )
                      .toList(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.withOpacity(0.3),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddDiseasePage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
