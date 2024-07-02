// ignore_for_file: unused_import, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/normal_user_screens/menu/normal_user_bottom_nav.dart';
import 'package:flutter_project_template/views/screens/profile/complete_profile.dart';
import 'package:flutter_project_template/views/screens/pharmacist_screens/menu/pharmacist_bottom_nav.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: Image.asset("assets/icons/back2.png"),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "OTP Verification",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Text(
                      "Enter the OTP sent to your mobile",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: otpController,
                decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter OTP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    var data = {
                      "phone": widget.phone,
                      "otp": otpController.text,
                    };
                    Map<String, dynamic> res =
                        await Provider.of<UserManagementProvider>(
                      context,
                      listen: false,
                    ).verifyOtp(context, data);
                    if (res['success']) {
                      if (res['user']['role'] == 'ADMIN') {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const PharmacistBottomNav(),
                          ),
                        );
                      } else if (res['user']['role'] == 'NORMAL') {
                        if (res['user']['gender'] == null) {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: const CompleteProfileScreen(),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: const NormalUserBottomNav(),
                            ),
                          );
                        }
                      }
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
                    "VERIFY OTP",
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
        ),
      ),
    );
  }
}
