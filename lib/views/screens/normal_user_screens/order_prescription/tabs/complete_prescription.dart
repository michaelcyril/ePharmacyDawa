import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/component/prescriptio_card.dart';
import 'package:intl/intl.dart';
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
                          (e) => PrescriptionCardWidget(
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
