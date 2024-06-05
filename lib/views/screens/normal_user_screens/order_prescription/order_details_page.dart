// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/default_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailsPageScreen extends StatefulWidget {
  final data;
  const OrderDetailsPageScreen({super.key, this.data});

  @override
  State<OrderDetailsPageScreen> createState() => _OrderDetailsPageScreenState();
}

class _OrderDetailsPageScreenState extends State<OrderDetailsPageScreen> {
  String formatDjangoDateTime(String djangoDateTime) {
    DateTime parsedDateTime = DateTime.parse(djangoDateTime);
    String formattedDate = DateFormat.yMMMd().format(parsedDateTime);
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    // Provider.of<OrderProvider>(context, listen: false)
    //     .getAllOrderProducts(widget.data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Order Details",
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
                      "Order Details",
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
                          "Order ID: 11111111",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black45),
                        ),
                        Text(
                          "Placed On: 12/12/2024",
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
                          "Kimara",
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
                      "0693331836",
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
                "Cart Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Name",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Price",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Qty",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Total",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Divider(),
              Consumer<DefaultProvider>(
                  builder: (context, recordProvider, child) {
                return   Column(
                        children: [1,2,3]
                            .map(
                              (e) => Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Paracetamol",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black45),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "1200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black45),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black45),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "2400",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black45),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      );
              }),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    width: 10,
                  )),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "7200",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "Delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "1,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Net Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "7200", 
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
