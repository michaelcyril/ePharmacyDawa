// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PrescriptionDetailsPageScreen extends StatefulWidget {
  final data;
  const PrescriptionDetailsPageScreen({super.key, this.data});

  @override
  State<PrescriptionDetailsPageScreen> createState() =>
      _OrderDetailsPageScreenState();
}

class _OrderDetailsPageScreenState
    extends State<PrescriptionDetailsPageScreen> {
  String formatDjangoDateTime(String djangoDateTime) {
    DateTime parsedDateTime = DateTime.parse(djangoDateTime);
    String formattedDate = DateFormat.yMMMd().format(parsedDateTime);
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    // Provider.of<OrderManagementProvider>(context, listen: false)
    //     .getOrderProducts(widget.data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Prescription Details",
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
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Prescription Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID: ${widget.data['prescription_id']}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black45),
                        ),
                        Text(
                          "Placed On: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.data['created_at']))} ${DateFormat('HH:mm').format(DateTime.parse(widget.data['created_at']))}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Payment Mode",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "CASH",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black45),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Delivery Address",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data['user']['address'],
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Contact Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data['user']['phone'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black45),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Prescription Image",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Image.network(
                AppConstants.mediaBaseUrl+widget.data['image'],
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
