import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/component/order_card.dart';
import 'package:provider/provider.dart';

class CompleteOrderTab extends StatefulWidget {
  const CompleteOrderTab({super.key});

  @override
  State<CompleteOrderTab> createState() => _PendingOrderTabState();
}

class _PendingOrderTabState extends State<CompleteOrderTab> {
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
    ).clientOrdersHistory(data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderManagementProvider>(builder: (context, value, child) {
      return value.getClientOrderHistoryList.isEmpty
          ? const Center(child: Text("No Order History"))
          : Column(
              children: value.getClientOrderHistoryList
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
