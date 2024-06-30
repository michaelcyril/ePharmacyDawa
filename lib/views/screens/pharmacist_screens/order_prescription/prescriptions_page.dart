import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/order_prescription/tabs/complete_prescription.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/order_prescription/tabs/pending_prescription.dart';
import 'package:provider/provider.dart';

class PrescriptionPagePharmacistScreen extends StatefulWidget {
  const PrescriptionPagePharmacistScreen({super.key});

  @override
  State<PrescriptionPagePharmacistScreen> createState() =>
      _PrescriptionPageScreenState();
}

class _PrescriptionPageScreenState
    extends State<PrescriptionPagePharmacistScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var user;

  @override
  void initState() {
    super.initState();
    getOrders();
    _tabController = TabController(length: 2, vsync: this);
  }

  getOrders() {
    Provider.of<PrescriptionManagementProvider>(
      context,
      listen: false,
    ).pharmacistPendingPrescriptions();
    Provider.of<PrescriptionManagementProvider>(
      context,
      listen: false,
    ).pharmacistPrescriptionsHistory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Prescriptions",
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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 00),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 235, 235, 235)),
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  color: const Color.fromARGB(255, 5, 185, 155),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                indicatorColor:
                                    const Color.fromARGB(255, 241, 241, 241),
                                unselectedLabelColor:
                                    const Color.fromARGB(255, 32, 32, 32),
                                labelColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                controller: _tabController,
                                tabs: const [
                                  Tab(text: "  Pending Prescription  "),
                                  Tab(text: "  Complete Prescription  "),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          PharmacistPendingPrescriptionTab(),
                          PharmacistCompletePrescriptionTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
