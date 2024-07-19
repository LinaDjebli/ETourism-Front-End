import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SelectButton.dart';
import 'package:tro/Componants/SelectChip.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/Text&Field.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/Create%20Activity/ActivityPageSix.dart';
import 'package:tro/Create%20Activity/Draft.dart' as Draft;
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
  String draftid ;
   ActivityPageFive({super.key, required this.draftid});

  @override
  State<ActivityPageFive> createState() => _ActivityPageFiveState();
}

class _ActivityPageFiveState extends State<ActivityPageFive> {
  TextEditingController UrlCotroller = TextEditingController();
  MultiSelectController _controller = MultiSelectController();
  List<String> people = [];
   List<String>  food = [];
    List<String>  transport = [];
   
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
  Column(
  children: [
    MultiSelectDropDownClass(
      sizewith: 350,
      Text: "Select a person",
      options: <ItemValue>[
        ItemValue(label: 'Guide', value: ""),
        ItemValue(label: 'Instructor', value: ""),
        ItemValue(label: 'Driver', value: ""),
        ItemValue(label: 'Host', value: ""),
      ],
      onOptionSelected: (List<String> selectedLabels) {
        setState(() {
          people = selectedLabels; // Update selectedItems with selected labels
          print(people); // Print the list of selected item labels
        });
      },
      optionTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    SizedBox(height: 10),
    Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: people
          .map((itemLabel) => Chip(
                backgroundColor: const Color.fromARGB(255, 232, 232, 232),
                label: Text(itemLabel),
                onDeleted: () {
                  setState(() {
                    people.remove(itemLabel); // Remove item label from selectedItems
                   // widget.onOptionSelected(selectedItems.toList()); // Update selected labels
                  });
                },
              ))
          .toList(),
    ),
  ],
),



            SizedBox(width: 250, child: Divider(color:Colors.black,)),
            gapH16,
            gapH12,
            gapH12,
            TextandField(
                tooltipText:
                    "Specify the availibily of food and what meal to expect ",
                Text: "is Food included ?",
                TextSize: 17),
            Column(children: <Widget>[
             
             // SizedBox(width: 350, child: Divider()),
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
                if (SlectedFood == 1) ...{
                  Column(
  children: [
    MultiSelectDropDownClass(
      sizewith: 350,
      Text: "Select a meal",
      options: <ItemValue>[
        ItemValue(label: 'Lunch', value: ""),
        ItemValue(label: 'Coffee', value: ""),
        ItemValue(label: 'Dinner', value: ""),
        ItemValue(label: 'snacks', value: ""),
      ],
      onOptionSelected: (List<String> selectedLabels) {
        setState(() {
          food = selectedLabels; // Update selectedItems with selected labels
          print(food); // Print the list of selected item labels
        });
      },
      optionTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    SizedBox(height: 10),
    Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: food
          .map((itemLabel) => Chip(
                backgroundColor: const Color.fromARGB(255, 232, 232, 232),
                label: Text(itemLabel),
                onDeleted: () {
                  setState(() {
                    food.remove(itemLabel); // Remove item label from selectedItems
                   // widget.onOptionSelected(selectedItems.toList()); // Update selected labels
                  });
                },
              ))
          .toList(),
    ),
  ],
),


              },
            ]),
             SizedBox(width: 250, child: Divider(color:Colors.black,)),
            gapH16,
            gapH12,
            gapH12,
              
            TextandField(
                tooltipText:
                    "Define if trnasportation is included in this activity ",
                Text: "is Transport included ? ",
                TextSize: 17),
            Column(children: <Widget>[
            
             // SizedBox(width: 350, child: Divider()),
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
               if (SelectedTransport == 1) ...{
                   Column(
  children: [
    MultiSelectDropDownClass(
      sizewith: 350,
      Text: "Select a Transportation",
      options: <ItemValue>[
        ItemValue(label: 'bus', value: ""),
        ItemValue(label: 'airplaine', value: ""),
        ItemValue(label: 'car', value: ""),
        ItemValue(label: 'boat', value: ""),
      ],
      onOptionSelected: (List<String> selectedLabels) {
        setState(() {
           transport = selectedLabels; // Update selectedItems with selected labels
          print(transport); // Print the list of selected item labels
        });
      },
      optionTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    SizedBox(height: 10),
    Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: transport
          .map((itemLabel) => Chip(
                backgroundColor: const Color.fromARGB(255, 232, 232, 232),
                label: Text(itemLabel),
                onDeleted: () {
                  setState(() {
                    transport.remove(itemLabel); // Remove item label from selectedItems
                   // widget.onOptionSelected(selectedItems.toList()); // Update selected labels
                  });
                },
              ))
          .toList(),
    ),
  ],
),
                 //SizedBox(width: 250, child: Divider(color:Colors.black,)),
              },
             
            ]),
            gapH28,
             Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:  nextMethod,
              child: Text("Save and Exit"),
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // background color
                onPrimary: Colors.blue, // text color
                side: BorderSide(color: Colors.blue), // border color
              ),
            ),
            SizedBox(width: 20), // gapW20
            ElevatedButton(
              onPressed: nextMethod,
              child: Text("Next"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background color
                onPrimary: Colors.white, // text color
              ),
            ),
          
          ],
          
        ),
          gapH28,
          ],
        ),
      )),
    );
  }

  nextMethod() {
     _saveDraft();
    // ignore: prefer_const_constructors
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  ActivityPageSix(draftid: widget.draftid,)));
  }

  void onpressed() {}
   Future<void> _saveDraft() async {
  

    
 
  // Add non-empty highlight fields to the highlites list
  
  // Add existing highlights to set to check for duplicates
  
  // Add highlights from text fields
   

    Map<String, dynamic> data = {
      'ActivityStaff': people.join(','),
      'food':   food.join(','),
      'transport':  transport.join(','),
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draft.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draft.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');
  }

  Future<void> _loadDraft() async {
    Map<String, dynamic> data = await  Draft.loadDraft(widget.draftid, ['ActivityStaff', 'food', 'transport']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
        people= data['ActivityStaff'].split(',');
       food = data['food'].split(',');
      transport = data['transport'].split(',');
    });
  }


  void iconOnPressed() {}

   
  void icononpressed() {}

   


}
