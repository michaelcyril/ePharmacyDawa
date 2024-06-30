import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/component/order_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PendingOrderTab extends StatefulWidget {
  const PendingOrderTab({super.key});

  @override
  State<PendingOrderTab> createState() => _PendingOrderTabState();
}

class _PendingOrderTabState extends State<PendingOrderTab> {
  @override
  void initState() {
    super.initState();
    getOrders();
  }

  getOrders() {
    var data =
        Provider.of<UserManagementProvider>(context, listen: false).getUserData;
    Provider.of<OrderManagementProvider>(
      context,
      listen: false,
    ).clientPendingOrders(data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderManagementProvider>(builder: (context, value, child) {
      return value.getClientPendiOrderList.isEmpty
          ? const Center(child: Text("No Pending Order"))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom:200.0),
                child: Column(
                    children: value.getClientPendiOrderList
                        .map<Widget>(
                          (e) => OrderCardWidget(
                            data: e,
                            confirmation: "",
                            mainText: "Order ID: ${e['order_id']}",
                            orderNo: e['status'],
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
