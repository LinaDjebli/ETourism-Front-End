import 'package:flutter/material.dart';




class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/caption.jpg"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child:
SizedBox(
  height: 60,
  width: 60,
  child: TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Colors.white),
      ),
      backgroundColor:  Color.fromRGBO(245, 246, 249, 1),
    ),
    onPressed: () {},
    child: Icon(
      Icons.photo_camera_outlined, // Replace this with the icon you want to use
      color: const Color.fromARGB(128, 0, 0, 0), // Adjust the color of the icon as needed
    ),
  ),
),
  )
        ],
      ),
    );
  }
}