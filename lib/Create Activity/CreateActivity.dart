import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/textfiled.dart';
import 'package:tro/constants/Size.dart';

class CreateActivity extends StatefulWidget {
  CreateActivity({super.key});

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  TextEditingController TextField1Controller = TextEditingController();
  TextEditingController Controller2 = TextEditingController();
  bool showHelpMessage = false;

  @override
  Widget build(BuildContext context) {
    int characterCount = 0;

    bool showHelpMessage = false;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 176, 171, 171),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          " ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            gapH12,
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Welcome , users",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    //font fam to add later
                  ),
                ),
              ],
            ),
            gapH12,
            Wrap(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(
                        "Writing a detailed description about your activity here",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 195, 194, 194),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          //font fam to add later
                        ),
                        softWrap:
                            true, // Allows the text to wrap to the next line
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gapH16,
            Row(
              children: [
                Text("gggggggggg",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 195, 194, 194),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            gapH16,
          /*  SizebaleTextfield(
              sizefield: 2,
              max: 12,
              controller: Controller2,
              hintText: "Enter your description here ",
              iconVisible: false,
              iconOnPressed: onPressed,
            ),*/
            gapH16,
          ],
        ),
      )),
    );
  }

  void onPressed() {}
}
