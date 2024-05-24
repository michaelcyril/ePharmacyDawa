// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: 238,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset("assets/images/panadol1.png"),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ...List.generate(
          //       //image length
          //       3,
          //       (index) => GestureDetector(
          //         onTap: () {},
          //         child: AnimatedContainer(
          //           duration: Duration(milliseconds: 250),
          //           margin: const EdgeInsets.only(right: 16),
          //           padding: const EdgeInsets.all(8),
          //           height: 48,
          //           width: 48,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(10),
          //             border:
          //                 Border.all(color: Color(0xFFFF7643).withOpacity(0)),
          //           ),
          //           child: Image.asset("assets/images/panadol1.png"),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20,),
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Panadol",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 64,
                    ),
                    child: Text(
                      "Panadol is apopular dhdhdnhds dhsbhbsd dshbfdhs fshdhfhds shfdhsbhfsd shdbhbfnds ",
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dosage: 400mg', // Display dosage
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Price: \Tsh 600.0', // Display price from product
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 50,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: 48,
                    decoration: const BoxDecoration(
                      color: true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/cart.png",
                      // colorFilter: const ColorFilter.mode(
                      //   true ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      //   BlendMode.srcIn,
                      // ),
                      height: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
