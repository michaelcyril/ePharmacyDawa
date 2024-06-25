// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_project_template/views/screens/auth/phone_number_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 200,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.height * 01,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/dawa2.png"),
                  filterQuality: FilterQuality.high)),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lets get Started!",
              style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(211, 14, 13, 13),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Continue to enjoy the features we've \nprovided, and stay healthy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(211, 14, 13, 13),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhoneNumberScreen(),
                  ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 3, 190, 150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "CONTINUE",
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
      ]),
    );
  }
}
