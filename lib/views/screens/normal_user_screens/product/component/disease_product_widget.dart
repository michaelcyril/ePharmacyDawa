// ignore_for_file: prefer_typing_uninitialized_variables, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiseaseProductCardWidget extends StatelessWidget {
  const DiseaseProductCardWidget(
      {super.key,
      this.width = 140,
      this.aspectRatio = 1.02,
      required this.onPress,
      required this.image,
      required this.title,
      required this.dosage,
      required this.price,
      required this.isFavorite});

  final double width, aspectRatio;
  final image;
  final title;
  final dosage;
  final price;
  final isFavorite;
  final VoidCallback onPress;

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
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    // setState(() {
                    //   isFavorite = !isFavorite;
                    // });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: true
                          ? const Color(0xFFFF7643).withOpacity(0.15)
                          : const Color(0xFF979797).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: true
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                    ),
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
