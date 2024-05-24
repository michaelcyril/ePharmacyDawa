import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/order_prescription/component/order_card.dart';

class PendingOrderTab extends StatelessWidget {
  const PendingOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OrderCardWidget(
          confirmation: "Pending",
          mainText: "Prescription 1",
          orderNo: "ID8239",
          date: "10/04/2024",
          time: "10:30 AM",
          image: "assets/images/pharmacist3.png",
        ),
        OrderCardWidget(
          confirmation: "Pending",
          mainText: "Prescription 1",
          orderNo: "ID8239",
          date: "10/04/2024",
          time: "10:30 AM",
          image: "assets/images/pharmacist3.png",
        ),
        OrderCardWidget(
          confirmation: "Pending",
          mainText: "Prescription 1",
          orderNo: "ID8239",
          date: "10/04/2024",
          time: "10:30 AM",
          image: "assets/images/pharmacist3.png",
        ),
      ],
    );
  }
}
