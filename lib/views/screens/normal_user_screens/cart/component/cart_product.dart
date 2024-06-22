// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/cart_management_provider.dart';
import 'package:provider/provider.dart';

class CartProductWidget extends StatefulWidget {
  final cartKey;
  final cartValue;
  const CartProductWidget({super.key, this.cartValue, this.cartKey});

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  removeFromCart(productId){
    Provider.of<CartManagementProvider>(context, listen: false).removeItem(productId);
  }

  decrementProduct(productId){
    Provider.of<CartManagementProvider>(context, listen: false).removeSingleItem(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/images/article.jpg"),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Panadol",
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "\Tsh600.0",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xFFFF7643)),
                children: [
                  TextSpan(
                      text: " x2",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
