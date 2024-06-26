// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/order_details_page.dart';

class OrderCardCompletePharmacistWidget extends StatefulWidget {
  const OrderCardCompletePharmacistWidget(
      {super.key,
      required this.mainText,
      required this.orderNo,
      required this.image,
      required this.date,
      required this.time,
      required this.confirmation,
      this.data});
  final String mainText;
  final String orderNo;
  final String image;
  final String date;
  final String time;
  final String confirmation;
  final data;

  @override
  State<OrderCardCompletePharmacistWidget> createState() =>
      _OrderCardCompleteWidgetState();
}

class _OrderCardCompleteWidgetState
    extends State<OrderCardCompletePharmacistWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Container(
          // height: 24,
          // width: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.mainText,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.orderNo,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 99, 99, 99),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: 10,
                      // width: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8), // Square shape
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '${widget.date}  ${widget.time}  ${widget.confirmation}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsPageScreen(data: widget.data),
                                ));
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 4, 190, 144),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Via Details",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 252, 252, 252),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
