// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/auth/otp_screen.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/dawa2.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: const Text(
                        "Enter Your Mobile Number",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        "An OTP will be sent for verification",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Your Contact Number",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "+255",
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      String inputNumber = textFieldController.text.trim();
                      // String pharmacistNumber = "769190100";
                      var data = {"phone": '255$inputNumber', "role": "NORMAL"};
                      bool result = await Provider.of<UserManagementProvider>(
                              context,
                              listen: false)
                          .verifyPhone(context, data);
                      if (result) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(
                                phone: '255$inputNumber',
                              ),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 190, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "By continuing you agree to ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Terms and Conditions",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "and ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Text(
                      " of ePharmacy",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
