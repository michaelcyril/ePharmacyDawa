import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/component/order_card.dart';
import 'package:provider/provider.dart';

class PendingPrescriptionTab extends StatefulWidget {
  const PendingPrescriptionTab({super.key});

  @override
  State<PendingPrescriptionTab> createState() => _PendingOrderTabState();
}

class _PendingOrderTabState extends State<PendingPrescriptionTab> {
  @override
  void initState() {
    super.initState();
    getOrders();
  }

  getOrders() {
    Provider.of<PrescriptionManagementProvider>(
      context,
      listen: false,
    ).pharmacistPendingPrescriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrescriptionManagementProvider>(builder: (context, value, child) {
      return value.getClientPendiPrescriptionList.isEmpty
          ? const Center(child: Text("No Pending Order"))
          : Column(
              children: value.getClientPendiPrescriptionList
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
                  .toList());
    });
  }
}
