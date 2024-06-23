import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/order_prescription/component/order_card.dart';
import 'package:provider/provider.dart';

class OrderRequestPage extends StatefulWidget {
  const OrderRequestPage({super.key});

  @override
  State<OrderRequestPage> createState() => _OrderRequestPageState();
}

class _OrderRequestPageState extends State<OrderRequestPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<OrderManagementProvider>(
      context,
      listen: false,
    ).pharmacistPendingOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Orders Requests",
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
      body: Consumer<OrderManagementProvider>(
        builder: (context, value, child) {
          return value.getPharmacistPendiOrderList.isEmpty
              ? const Center(child: Text("No Order Requests"))
              : ListView(
                  children: value.getPharmacistPendiOrderList
                      .map<Widget>((e) => const OrderCardPharmacistWidget(
                            confirmation: "Pending",
                            mainText: "Prescription 1",
                            orderNo: "ID8239",
                            date: "10/04/2024",
                            time: "10:30 AM",
                            image: "assets/images/pharmacist3.png",
                          ))
                      .toList(),
                );
        },
      ),
    );
  }
}
