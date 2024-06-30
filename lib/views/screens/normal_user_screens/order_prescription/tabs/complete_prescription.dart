import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/component/order_card.dart';
import 'package:provider/provider.dart';

class CompletePrescriptionTab extends StatefulWidget {
  const CompletePrescriptionTab({super.key});

  @override
  State<CompletePrescriptionTab> createState() => _PendingOrderTabState();
}

class _PendingOrderTabState extends State<CompletePrescriptionTab> {
  @override
  void initState() {
    super.initState();
    getOrders();
  }

  getOrders() {
    var data =
        Provider.of<UserManagementProvider>(context, listen: false).getUserData;
    Provider.of<PrescriptionManagementProvider>(
      context,
      listen: false,
    ).clientPrescriptionsHistory(data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrescriptionManagementProvider>(builder: (context, value, child) {
      return value.getClientPrescriptionHistoryList.isEmpty
          ? const Center(child: Text("No Pending Order"))
          : SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(bottom:200.0),
              child: Column(
                  children: value.getClientPrescriptionHistoryList
                      .map<Widget>(
                        (e) => const OrderCardWidget(
                          confirmation: "Pending",
                          mainText: "Prescription 1",
                          orderNo: "ID8239",
                          date: "10/04/2024",
                          time: "10:30 AM",
                          image: "assets/images/pharmacist3.png",
                        ),
                      )
                      .toList()),
            ),
          );
    });
  }
}
