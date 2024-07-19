import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:link_text/link_text.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:tro/Componants/List_Of_States.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Create%20Activity/ActivityPageSeven.dart';
import 'package:tro/Create%20Activity/Draft.dart' as Draftm;
import 'package:tro/componants/Search.dart';
import 'package:tro/Componants/SelectButton.dart';
import 'package:tro/Componants/Text&Field.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';

class ActivityPageSix extends StatefulWidget {
  String draftid ;
  ActivityPageSix({super.key,required this.draftid});

  @override
  State<ActivityPageSix> createState() => _ActivityPageSixState();
}

class _ActivityPageSixState extends State<ActivityPageSix> {
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController phonecntrlr = TextEditingController();

  List<String> suitableOptions = [];
  List<String> notAllowedOptions = [];
  List<String> itemsToBringOptions = [];
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
                index: 4,
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
                          "Activity Inclusions  ",
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
                tooltipText: "",
                Text: "What is Not Suitable for this activity",
                TextSize: 16,
              ),
              gapH16,
              SizedBox(
                width: 350,
                child: MultiSelectDropDown(
                  clearIcon: Icon(Icons.clear),
                  onOptionSelected: (options) {
                    setState(() {
                      suitableOptions = options.map((item) => item.label).toList();
                      print(suitableOptions);
                    });
                  },
                  options: <ValueItem>[
                    ValueItem(label: 'People over 70 years', value: '1'),
                    ValueItem(label: 'Babies under 1 year', value: '2'),
                    ValueItem(label: 'Children under 10 years', value: '3'),
                    ValueItem(label: 'Children between 10 years and 13 years', value: '4'),
                    ValueItem(label: 'Children under 18 years', value: '5'),
                    ValueItem(label: 'People with high blood pressure', value: '6'),
                    ValueItem(label: 'People with lactose intolerance', value: '7'),
                    ValueItem(label: 'Non-swimmers', value: '8'),
                    ValueItem(label: 'People afraid of heights', value: '8'),
                    ValueItem(label: 'People with animal allergies', value: '9'),
                    ValueItem(label: 'Pregnant women', value: '10'),
                    ValueItem(label: 'Desabled people', value: '11'),
                  ],

                  maxItems: 7,
                  disabledOptions: const [
                    ValueItem(label: 'Option 1', value: '1'),
                  ],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap,
                    backgroundColor: Colors.blue,
                  ),
                  dropdownHeight: 300,
                  selectedOptionTextColor: Colors.blue,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),

              // Repeat the above MultiSelectDropDown for Not Allowed and Items to Bring with similar logic

              gapH32,
              TextandField(
                tooltipText: "",
                Text: "What is Not allowed for this activity",
                TextSize: 16,
              ),
              gapH16,
              SizedBox(
                width: 350,
                child: MultiSelectDropDown(
                  clearIcon: Icon(Icons.clear),
                  onOptionSelected: (options) {
                    setState(() {
                      notAllowedOptions = options.map((item) => item.label).toList();
                    });
                  },
                  options: const <ValueItem>[
                    ValueItem(label: ' Smoking ', value: '1'),
                    ValueItem(label: 'Audio recording', value: '2'),
                    ValueItem(label: 'Baby carriages', value: '3'),
                    ValueItem(label: 'Baby strollers', value: '4'),
                    ValueItem(label: 'Bikes', value: '5'),
                    ValueItem(label: 'Electric wheelchairs', value: '6'),
                    ValueItem(label: 'Feeding animals', value: '7'),
                    ValueItem(label: 'Firework', value: '8'),
                    ValueItem(label: 'Jewelry', value: '9'),
                    ValueItem(label: 'Oversize luggage', value: '10'),
                    ValueItem(label: 'Swimming', value: '11'),
                    ValueItem(label: 'Tablets/iPads/Computers', value: '12'),
                    ValueItem(label: 'Alcohol', value: '13'),
                  ],
                  maxItems: 7,
                  disabledOptions: const [
                    ValueItem(label: 'Option 1', value: '1'),
                  ],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap,
                    backgroundColor: Colors.blue,
                  ),
                  dropdownHeight: 300,
                  selectedOptionTextColor: Colors.blue,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),

              gapH32,
              TextandField(
                tooltipText: "",
                Text: "What items should customers bring with them",
                TextSize: 16,
              ),
              gapH16,
              SizedBox(
                width: 350,
                child: MultiSelectDropDown(
                  clearIcon: Icon(Icons.clear),
                  onOptionSelected: (options) {
                    setState(() {
                      itemsToBringOptions = options.map((item) => item.label).toList();
                    });
                  },
                  options: const <ValueItem>[
                    ValueItem(label: 'Beachwear', value: '1'),
                    ValueItem(label: 'Cash', value: '2'),
                    ValueItem(label: 'Change of clothes', value: '3'),
                    ValueItem(label: 'Food', value: '4'),
                    ValueItem(label: 'Water ', value: '5'),
                    ValueItem(label: 'Comfortable clothes', value: '6'),
                    ValueItem(label: 'Face mask or protective covering', value: '7'),
                    ValueItem(label: 'Snow clothing', value: '8'),
                    ValueItem(label: 'Passport or ID card', value: '9'),
                    ValueItem(label: 'Rain gear', value: '10'),
                    ValueItem(label: 'Sleeping bag', value: '11'),
                    ValueItem(label: 'Hat', value: '12'),
                  ],
                  maxItems: 7,
                  disabledOptions: const [
                    ValueItem(label: 'Option 1', value: '1'),
                  ],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap,
                    backgroundColor: Colors.blue,
                  ),
                  dropdownHeight: 300,
                  selectedOptionTextColor: Colors.blue,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),

              gapH32,
              TextandField(
                tooltipText: "",
                Text: "Emergency Contact",
                TextSize: 16,
              ),
              gapH18,
              SizedBox(
                width: 350,
                child: IntlPhoneField(
                  controller: phonecntrlr,
                  cursorColor: const Color.fromARGB(255, 0, 0, 0),
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    fillColor: Color.fromARGB(255, 0, 0, 0),
                    labelText: "Phone number",
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ),

                Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: nextMethod ,
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
        gapH24
            ],
          ),
        ),
      ),
    );
  }
void onpressed() {}
   Future<void> _saveDraft() async {
  
    Map<String, dynamic> data = {
      'suitablefor': suitableOptions.join(','),
      'notalloawed':   notAllowedOptions.join(','),
      'itemsTobring':  itemsToBringOptions.join(','),
      'phonenumber':phonecntrlr.text,
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftm.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftm.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');
  }

  Future<void> _loadDraft() async {
    Map<String, dynamic> data = await  Draftm.loadDraft(widget.draftid, ['suitablefor', 'notalloawed', 'itemstobring','phonenumber']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
        suitableOptions= data['suitablefor'].split(',');
       notAllowedOptions = data['notalloawed'].split(',');
      itemsToBringOptions = data['itemstobring'].split(',');
      phonecntrlr.text =  data['phonenumber'];
    });
  }
  void nextMethod() {
    _saveDraft();
    // Example of how to pass the collected data to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityPageSeven(draftid: widget.draftid,
          
        ),
      ),
    );
  }
}