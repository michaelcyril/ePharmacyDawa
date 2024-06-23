import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:provider/provider.dart';

import 'component/order_card.dart';

class RequestedPrescriptionPagePharmacistScreen extends StatefulWidget {
  const RequestedPrescriptionPagePharmacistScreen({super.key});

  @override
  State<RequestedPrescriptionPagePharmacistScreen> createState() =>
      _RequestedPrescriptionPageScreenState();
}

class _RequestedPrescriptionPageScreenState
    extends State<RequestedPrescriptionPagePharmacistScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<PrescriptionManagementProvider>(
      context,
      listen: false,
    ).pharmacistPendingPrescriptions();
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
      body: Consumer<PrescriptionManagementProvider>(
        builder: (context, value, child) {
          return value.getPharmacistPendiPrescriptionList.isEmpty
              ? const Center(child: Text("No Order History"))
              : SingleChildScrollView(
                  child: Column(
                    children: value.getPharmacistPendiPrescriptionList
                        .map<Widget>((e) => OrderCardPharmacistWidget(
                              prescription: e,
                              confirmation: "Pending",
                              mainText: "Prescription 1",
                              orderNo: "ID8239",
                              date: "10/04/2024",
                              time: "10:30 AM",
                              image: "assets/images/pharmacist3.png",
                            ))
                        .toList(),
                  ),
                );
        },
      ),
    );
  }
}
