// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/cart_management_provider.dart';
import 'package:flutter_project_template/providers/disease_management_provider.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/cart/cart_page.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/home/component/product_card_widget.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/home/component/tropical_disease_card.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/upload_prescription.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/disease_products.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/otc_products.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/product/product_details.dart';
import 'package:flutter_project_template/widget/icon_buttom_with_counter.dart';
import 'package:provider/provider.dart';

class HomePageNormalUserScreen extends StatefulWidget {
  const HomePageNormalUserScreen({super.key});

  @override
  State<HomePageNormalUserScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageNormalUserScreen> {
  @override
  void initState() {
    super.initState();
    getItemCounts();
    Provider.of<DiseaseManagementProvider>(
      context,
      listen: false,
    ).getDiseases();
    Provider.of<MedicineManagementProvider>(
      context,
      listen: false,
    ).getOtcMedicines();
  }

  var itemCount = 0;
  getItemCounts() {
    var itemC =
        Provider.of<CartManagementProvider>(context, listen: false).itemCount;
    setState(() {
      itemCount = itemC;
    });
  }

  var desease_list = [1, 2, 3, 4];
  var knowledge_list = [1, 2, 3, 4];
  var otc_medicine_list = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo.withOpacity(0.3),
                  Colors.white.withOpacity(0.3),
                  Colors.indigo.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.5, 0.8],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'What medicine\ndo you need?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Positioned(
                  top: 30,
                  right: 5,
                  child: Row(
                    children: [
                      // const SizedBox(width: 8),
                      IconButtonWIthCounter(
                        image: "assets/images/cart.png",
                        numOfitem: itemCount,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPageScreen(),
                              ));
                        },
                      ),
                      // const SizedBox(width: 16),
                      // IconButtonWIthCounter(
                      //   image: "assets/icons/bell.png",
                      //   numOfitem: 4,
                      //   press: () {},
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Row(
                  children: knowledge_list
                      .map<Widget>(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(153, 236, 232, 232),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          const Text(
                                            "Early protection for\nyour family health",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black87),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.026,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 4, 138, 109),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Learn More",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                ]),
                                          )
                                        ]),
                                  ),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset(
                                          "assets/icons/female.png"))
                                ]),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UploadPrescriptionScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Card(
                color: Colors.white,
                elevation: 0, // Remove elevation shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.grey.shade200, width: 2), // Add border
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order with prescription",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 136, 102),
                            ),
                          ),
                          Text(
                            "We'll get back to you",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 90,
                        height: 45,
                        child: Card(
                          elevation: 1,
                          color: const Color.fromARGB(255, 0, 136, 102),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tropical Diseases",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to OTCScreen when the button is pressed
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const DiseaseProductPage()),
                    // );
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: const Text("See more"),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<DiseaseManagementProvider>(
                builder: (context, value, child) {
              return value.getDiseaseList.isEmpty
                  ? Row(
                      children: [1, 2]
                          .map(
                            (e) => TropoicalDiseaseWidget(
                              image: "assets/images/Malaria.jpg",
                              category: "",
                              numOfMeds: 18,
                              press: () {},
                            ),
                          )
                          .toList(),
                    )
                  : Row(
                      children: value.getDiseaseList
                          .map<Widget>(
                            (e) => TropoicalDiseaseWidget(
                              image: "assets/images/Malaria.jpg",
                              category: e['name'],
                              numOfMeds: 18,
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiseaseProductPage(
                                      diseaseId: e['id'],
                                      diseaseName: e['name'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    );
            }),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "OTC Medicine",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to OTCScreen when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtcProductsScreen()),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: const Text("See more"),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Consumer<MedicineManagementProvider>(
                  builder: (context, value, child) {
                return value.getOtcMedicineList.isEmpty
                    ? Row(
                        children: [1, 2]
                            .map(
                              (e) => ProductCardWidget(
                                onPress: () {},
                                addToFavorites: () {},
                                isFavorite: true,
                                updateCartCount: (int) {},
                                title: "----",
                                dosage: "----",
                                image: "assets/image/dawa1.png",
                                price: "---",
                              ),
                            )
                            .toList(),
                      )
                    : Row(
                        children: value.getOtcMedicineList
                            .map<Widget>((e) => Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ProductCardWidget(
                                    product: e,
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreen(
                                              productData: e,
                                            ),
                                          ));
                                    },
                                    addToFavorites: () {},
                                    isFavorite: true,
                                    updateCartCount: (int) {},
                                    title: e['name'],
                                    dosage: e['dosage'],
                                    image: "assets/images/dawa1.png",
                                    price: e['price'],
                                  ),
                                ))
                            .toList(),
                      );
              })),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
