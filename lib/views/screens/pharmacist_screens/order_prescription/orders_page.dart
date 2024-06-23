import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/order_prescription/component/order_card.dart';
import 'package:provider/provider.dart';

class OrdersPagePharmacistScreen extends StatefulWidget {
  const OrdersPagePharmacistScreen({super.key});

  @override
  State<OrdersPagePharmacistScreen> createState() => _OrdersPageScreenState();
}

class _OrdersPageScreenState extends State<OrdersPagePharmacistScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<OrderManagementProvider>(
      context,
      listen: false,
    ).pharmacistOrdersHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Orders",
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
          return value.getPharmacistOrderHistoryList.isEmpty
              ? const Center(child: Text("No Order History"))
              : ListView(
                  children: [1, 2, 3, 4]
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
