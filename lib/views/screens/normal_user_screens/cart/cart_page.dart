// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_project_template/models/product_model.dart';
import 'package:flutter_project_template/providers/cart_management_provider.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/cart/component/cart_product.dart';
import 'package:provider/provider.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  var userData;

  setUserData() {
    var data =
        Provider.of<UserManagementProvider>(context, listen: false).getUserData;
    setState(() {
      userData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Cart",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<CartManagementProvider>(
          builder: (context, value, child) {
            return value.items.isEmpty
                ? const Center(child: Text("Empty Cart"))
                : ListView.builder(
                    itemCount: value.items.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CartProductWidget(
                        cartValue: value.items.values.toList()[index],
                        cartKey: value.items.keys.toList()[index],
                      ),
                    ),
                  );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text:
                                "Tsh ${Provider.of<CartManagementProvider>(context).totalAmount.toString()}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Map<String, CartItem> cart_data =
                            await Provider.of<CartManagementProvider>(context,
                                    listen: false)
                                .items;
                        List<Map<String, dynamic>> orderMedicine =
                            cart_data.values.map((item) {
                          return {
                            'medicine': item.id,
                            'dosage': 'dosage_value',
                            'total_amount': item.price * item.quantity,
                            'quantity': item.quantity
                          };
                        }).toList();

                        var total_price =
                            await Provider.of<CartManagementProvider>(context,
                                    listen: false)
                                .totalAmount;

                        Map<String, dynamic> orderData = {
                          'client': userData['id'],
                          'total_price': total_price,
                          'order_medicine': orderMedicine
                        };
                        Map<String, dynamic> res =
                            await Provider.of<OrderManagementProvider>(context,
                                    listen: false)
                                .addOrder(orderData);
                        if (res['save']) {
                          Provider.of<CartManagementProvider>(context,
                                  listen: false)
                              .clear();
                          Navigator.pop(context);
                        } else {
                          SnackBar(
                            content: Text(res['message']),
                            duration: const Duration(seconds: 3),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 190, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Checkout",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                        ),
                      ),
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
