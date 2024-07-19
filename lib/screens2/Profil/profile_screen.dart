import 'package:flutter/material.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(195, 56, 56, 56),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 80),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () => {},
            ),
            ProfileMenu(
              text: "Account",
              icon: Icons.person,
              press: () {},
            ),
            ProfileMenu(
              text: "Wich List",
              icon: Icons.edit,
              press: () {},
            ),
            ProfileMenu(
              text: "Appearance",
              icon: Icons.apartment,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

