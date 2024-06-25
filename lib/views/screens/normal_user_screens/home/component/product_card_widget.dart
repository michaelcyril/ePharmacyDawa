// ignore_for_file: prefer_typing_uninitialized_variables, dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      {super.key,
      this.width = 140,
      this.aspectRatio = 1.02,
      this.product,
      required this.onPress,
      required this.updateCartCount,
      required this.addToFavorites,
      required this.isFavorite,
      this.title,
      this.dosage,
      this.image,
      this.price,
      this.userRole});

  final double width, aspectRatio;
  final product;
  final title;
  final dosage;
  final image;
  final price;
  final VoidCallback onPress;
  final Function(int) updateCartCount;
  final Function() addToFavorites;
  final bool isFavorite;
  final userRole;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF979797).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(image),
                  ),
                ),
                userRole == null
                    ? const SizedBox()
                    : userRole == "NORMAL"
                        ? Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                updateCartCount(1);
                              },
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.add_circled_solid,
                                  color: Color(0xFFFF7643),
                                  size: 24,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$title\n$dosage',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tsh $price",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
