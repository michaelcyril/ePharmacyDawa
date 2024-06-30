import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/order_prescription/component/prescriptio_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PharmacistPendingPrescriptionTab extends StatefulWidget {
  const PharmacistPendingPrescriptionTab({super.key});

  @override
  State<PharmacistPendingPrescriptionTab> createState() => _PendingOrderTabState();
}

class _PendingOrderTabState extends State<PharmacistPendingPrescriptionTab> {
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
    return Consumer<PrescriptionManagementProvider>(
        builder: (context, value, child) {
      return value.getPharmacistPendiPrescriptionList.isEmpty
          ? const Center(child: Text("No Pending Prescription"))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200.0),
                child: Column(
                    children: value.getPharmacistPendiPrescriptionList
                        .map<Widget>(
                          (e) => PharmacistPrescriptionCardWidget(
                            data: e,
                            confirmation: e['status'],
                            mainText: e['prescription_id'],
                            orderNo: e['user']['gender'],
                            date: DateFormat('yyyy-MM-dd')
                                .format(DateTime.parse(e['created_at'])),
                            time: DateFormat('HH:mm')
                                .format(DateTime.parse(e['created_at'])),
                            image: "assets/images/pharmacist3.png",
                          ),
                        )
                        .toList()),
              ),
            );
    });
  }
}
