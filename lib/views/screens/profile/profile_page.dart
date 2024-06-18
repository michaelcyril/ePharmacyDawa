import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/screens/profile/component/profile_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  var userData;
  setUserData() {
    var data =
        Provider.of<UserManagementProvider>(context, listen: false).getUserData;
    setState(() {
      userData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 40), // Adjust this height if needed
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/Profile Image.png"),
                  ),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(color: Colors.white),
                          ),
                          backgroundColor: const Color(0xFFF5F6F9),
                        ),
                        onPressed: () async {
                          final picker = ImagePicker();
                          final pickedFile = await picker.getImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {}
                        },
                        child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20), // Adjust this height if needed
            ProfileMenuWidget(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              color: const Color.fromARGB(255, 0, 136, 102),
              press: () {
                // Navigator.pushNamed(context, MyAccountScreen.routeName);
              },
            ),
            ProfileMenuWidget(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              color: const Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
            ProfileMenuWidget(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              color: const Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
            ProfileMenuWidget(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              color: const Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
            ProfileMenuWidget(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              color: const Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
