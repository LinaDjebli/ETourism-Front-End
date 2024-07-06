import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SelectButton.dart';
import 'package:tro/Componants/SelectChip.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/Text&Field.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/network_config.dart';

import "package:multi_dropdown/models/value_item.dart";

import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/widgets/hint_text.dart';
import 'package:multi_dropdown/widgets/selection_chip.dart';
import 'package:multi_dropdown/widgets/single_selected_item.dart';
import 'package:flutter/material.dart';
import "package:multi_dropdown/models/value_item.dart";

class ActivityPageFive extends StatefulWidget {
  const ActivityPageFive({super.key});

  @override
  State<ActivityPageFive> createState() => _ActivityPageFiveState();
}

class _ActivityPageFiveState extends State<ActivityPageFive> {
  TextEditingController UrlCotroller = TextEditingController();
  MultiSelectController _controller = MultiSelectController();
  List<String> selectedItems = [];
  int SlectedFood = 0;
  int SelectedTransport = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Activity Creation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalTimeline(
              index: 3,
            ),
            Wrap(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Continue Creating your activity ",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 30,
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
            TextandField(
                tooltipText:
                    "Specify people which the cosumer need to interact with",
                Text: "Who the costumer will interact with ",
                TextSize: 17),
            gapH18,
            SelectButton(
              sizeofwidth: 350,
              Text: "Select a person ",
              buttonText: 'Select Options',
              listOfItems: <ItemValue<int>>[
                ItemValue(label: 'Guide', value: 1),
                ItemValue(label: 'Instrocure', value: 2),
                ItemValue(label: 'Driver', value: 3),
                ItemValue(label: 'Host', value: 4),
              ],
              textOfList: 'Options',
            ),
            gapH16,
            TextandField(
                tooltipText:
                    "Specify the availibily of food and what meal to expect ",
                Text: "is Food included ?",
                TextSize: 17),
            Column(children: <Widget>[
              RadioListTile(
                title: Text('Yes '),
                value: 1,
                groupValue: SlectedFood,
                onChanged: (value) {
                  setState(() {
                    SlectedFood = value as int;
                  });
                },
              ),
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title: Text('No'),
                value: 2,
                groupValue: SlectedFood,
                onChanged: (value) {
                  setState(() {
                    SlectedFood = value as int;
                  });
                },
              ),
              if (SlectedFood == 1) ...{
                SelectButton(
                  Text: "Select Meals",
                  sizeofwidth: 200,
                  listOfItems: <ItemValue<int>>[
                    ItemValue(label: 'Coffe', value: 1),
                    ItemValue(label: ' Lunch', value: 2),
                    ItemValue(label: 'Afternoon Coffee', value: 3),
                    ItemValue(label: ' Diner', value: 4),
                  ],
                  textOfList: "",
                  buttonText: "Food",
                )
              }
            ]),
            gapH18,
            TextandField(
                tooltipText:
                    "Define if trnasportation is included in this activity ",
                Text: "is Transport included ? ",
                TextSize: 17),
            Column(children: <Widget>[
              RadioListTile(
                title: Text('Yes '),
                value: 1,
                groupValue: SelectedTransport,
                onChanged: (value) {
                  setState(() {
                    SelectedTransport = value as int;
                  });
                },
              ),
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title: Text('No'),
                value: 2,
                groupValue: SelectedTransport,
                onChanged: (value) {
                  setState(() {
                    SelectedTransport = value as int;
                  });
                },
              ),
              if (SelectedTransport == 1) ...{
                Column(
                  children: [
                    SelectButton(
                      Text: "Select Transport",
                      sizeofwidth: 200,
                      listOfItems: <ItemValue<int>>[
                        ItemValue(label: 'car', value: 1),
                        ItemValue(label: ' bus', value: 2),
                        ItemValue(label: 'Baot', value: 3),
                        ItemValue(label: ' Train', value: 4),
                      ],
                      textOfList: "",
                      buttonText: "Transport",
                    ),
                    TextandField(
                        tooltipText:
                            "if the costuer travel from place to place where does he go ? ",
                        Text: "Does the costumer change region ? ",
                        TextSize: 17),
                  /*  SizebaleTextfield(
                        controller: UrlCotroller,
                        sizefield: 1,
                        max: 10,
                        hintText: "Url",
                        iconVisible: false,
                        iconOnPressed: onpressed)*/
                  ],
                )
              }
            ]),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 150, child: sigin(onTap: nextMethod, btntext: "Next")),
            )
          ],
        ),
      )),
    );
  }

  nextMethod() {
    // ignore: prefer_const_constructors
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ActivityCategory()));
  }

  void onpressed() {}
}
