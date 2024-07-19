import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;

  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 60, // Set a fixed height for the container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: press,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Adjust padding here
        leading: Icon(
          icon,
          color: Colors.black,
          size: 20, // Adjust the size of the icon
        ),
        title: Row(
          children: [
            SizedBox(width: 10), // Add space between the icon and text
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 15), // Adjust the font size
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 20, // Adjust the size of the trailing icon
        ),
        horizontalTitleGap: 0, // Align title horizontally
        dense: true, // Reduce the height of the ListTile
      ),
    );
  }
}









