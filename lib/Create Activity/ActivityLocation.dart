import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:link_text/link_text.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:tro/Componants/List_Of_States.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/Create%20Activity/ActivityPageFive.dart';
import 'package:tro/Create%20Activity/Draft.dart' as Draft ;
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';

class ActivityLocation extends StatefulWidget {
  String draftid ; 
 
   ActivityLocation({super.key,required this.draftid});

  @override
  State<ActivityLocation> createState() => _ActivityLocationState();
}

class _ActivityLocationState extends State<ActivityLocation> {
   final List<TextEditingController> _includecontrollers = [];
  final List<Widget> _includetextFields = [];
     final List<TextEditingController> _notincludecontrollers = [];
      List<String>  _includecontrollerss = [];
      List<String>  _notincludecontrollerss = [];
  final List<Widget> _notincludetextFields = [];
 TextEditingController _includes = TextEditingController();
   TextEditingController _notincludes = TextEditingController();
    TextEditingController destinationcontroller = TextEditingController();
static const List<String> optionsarraivel = [
    "Coastal" , "Mountainous ","City" , "Desert", "Forest" , 
  ];
  static const List<String> wilayat = [
  "Adrar", "Chlef", "Laghouat", "Oum El Bouaghi", "Batna", "Béjaïa",
  "Biskra", "Béchar", "Blida", "Bouira", "Tamanrasset", "Tébessa",
  "Tlemcen", "Tiaret", "Tizi Ouzou", "Algiers", "Djelfa", "Jijel",
  "Sétif", "Saïda", "Skikda", "Sidi Bel Abbès", "Annaba", "Guelma",
  "Constantine", "Médéa", "Mostaganem", "M'Sila", "Mascara", "Ouargla",
  "Oran", "El Bayadh", "Illizi", "Bordj Bou Arréridj", "Boumerdès",
  "El Tarf", "Tindouf", "Tissemsilt", "El Oued", "Khenchela", "Souk Ahras",
  "Tipaza", "Mila", "Aïn Defla", "Naâma", "Aïn Témouchent", "Ghardaïa",
  "Relizane", "Timimoun", "Bordj Badji Mokhtar", "Ouled Djellal",
  "Béni Abbès", "In Salah", "In Guezzam", "Touggourt", "Djanet",
  "El M'Ghair", "El Meniaa"
];

  
String  arraivel = optionsarraivel.first;
String  wilaya = wilayat.first;
  @override
  void dispose() {
    // Dispose of all the controllers when the widget is disposed
    for (var controller in _includecontrollers) {
      controller.dispose();
    }
    for (var controller in _notincludecontrollers) {
      controller.dispose();
    }

    super.dispose();
  }
void RemoveTextField() {
    if (_includetextFields.isNotEmpty) {
      _includetextFields.removeLast(); // Remove the last text field
      _includecontrollers.removeLast();
        _includecontrollerss.removeLast();  // Remove the corresponding controller
    }
    setState(() {});
  }
  void _addIncludesTextField() {
    final includecontroller = TextEditingController();
    _includecontrollers.add(includecontroller);
   // _includecontrollerss.add(includecontroller.text);
    _includetextFields.add(
     SizebaleTextfield(
        controller: includecontroller,
        sizefield: 1,
        max: 80,
        hintText: "includes",
        iconVisible: true,
        iconOnPressed: RemoveincludeTextField,errortext: '', eroorcond:  true , onChanged: (String ) {  },
      ),
    );

    setState(() {});
  }
 void _addNotIncludesTextField() {
    final notincludecontroller = TextEditingController();
    _notincludecontrollers.add(notincludecontroller);
   // _notincludecontrollerss.add(notincludecontroller.text);
    _notincludetextFields.add(
     SizebaleTextfield(
        controller: notincludecontroller,
        sizefield: 1,
        max: 80,
        hintText: "Not includes ",
        iconVisible: true,
        iconOnPressed:  RemovenotincludeTextField,errortext: '', eroorcond:  true , onChanged: (String ) {  },
      ),
    );

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
   
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
              index: 2,
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
                        "Location informations  ",
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
            Wrap(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Where the costumer will visit ? ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 14, 64, 122),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              //font fam to add later
                            ),

                            softWrap:
                                true, // Allows the text to wrap to the next line
                          ),
                          Tooltip(
                            padding: EdgeInsets.all(20),
                            message:
                                "Specify the place or places where the costumer will visit on this activity",
                            child: Icon(
                              Icons.info_outline,
                              color: const Color.fromARGB(255, 27, 124, 235),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gapH16,
           /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TypeAheadField(
                      noItemsFoundBuilder: (context) => const SizedBox(
                            height: 50,
                            child: Center(
                              child: Row(
                                children: [
                                  Text("No Item Found "),
                                  LinkText(
                                    "Search in GoogleMaps",
                                    // onLinkTap:(url) =>  ,
                                    textStyle: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                      suggestionsCallback: (value) =>
                          ListOfStates.getSuggestion(value),
                      itemBuilder: (context, String suggestion) {
                        return Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            suggestion,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },

                      //hideKeyboard: true,
                      debounceDuration: const Duration(milliseconds: 400),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          hintText: "search",
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(108, 120, 116, 116)),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set borderRadius here
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(108, 117, 115, 115)),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set borderRadius here
                          ),
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                      ),
                      onSuggestionSelected: (String suggestion) {
                        setState(() {
                          _controller.text =
                              suggestion; // Update the text field with the selected suggestion
                        });
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(109, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                          ),
                        );
                      }),
                ],
              ),
            ),*/
            SizebaleTextfield(
              eroorcond: true,

                controller: destinationcontroller,
                sizefield: 1,
                max: 40,
                hintText: "Location url ",
                iconVisible: false,
                // ignore: avoid_types_as_parameter_names
                iconOnPressed: iconOnPressed,errortext: '', onChanged: (String ) {  },),
        
            gapH12,
             Wrap(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "What region your destination belogns to ?",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 14, 64, 122),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              //font fam to add later
                            ),

                            softWrap:
                                true, // Allows the text to wrap to the next line
                          ),
                          Tooltip(
                            padding: EdgeInsets.all(20),
                            message:
                                "Specify the place or places where the costumer will visit on this activity",
                            child: Icon(
                              Icons.info_outline,
                              color: const Color.fromARGB(255, 27, 124, 235),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            gapH18,
          Container(
      width: 200,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: arraivel,
          hint: Text("Select an option"),
          onChanged: (String? newValue) {
            setState(() {
              arraivel = newValue!;
              print(arraivel);
            });
          },
          items: optionsarraivel.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down), // Custom icon
          iconSize: 24,
          iconEnabledColor: Colors.grey,
          dropdownColor: Colors.white,
          alignment: Alignment.centerRight, // Align the icon to the right
          isExpanded: true, // Expand the button to fill the width
        ),
      ),
    ),
     gapH18,
     gapH18,
       gapH12,
             Wrap(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "What Wilaya your destination is?",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 14, 64, 122),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              //font fam to add later
                            ),

                            softWrap:
                                true, // Allows the text to wrap to the next line
                          ),
                          Tooltip(
                            padding: EdgeInsets.all(20),
                            message:
                                "Specify the place or places where the costumer will visit on this activity",
                            child: Icon(
                              Icons.info_outline,
                              color: const Color.fromARGB(255, 27, 124, 235),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            gapH18,
          Container(
      width: 200,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: wilaya,
          hint: Text("Select an option"),
          onChanged: (String? newValue) {
            setState(() {
              wilaya = newValue!;
              print(wilaya);
            });
          },
          items: wilayat.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down), // Custom icon
          iconSize: 24,
          iconEnabledColor: Colors.grey,
          dropdownColor: Colors.white,
          alignment: Alignment.centerRight, // Align the icon to the right
          isExpanded: true, // Expand the button to fill the width
        ),
      ),
    ),
     gapH18,
     gapH18,
             Wrap(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "What is included ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 14, 64, 122),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            //font fam to add later
                          ),

                          softWrap:
                              true, // Allows the text to wrap to the next line
                        ),
                        Tooltip(
                          padding: EdgeInsets.all(20),
                          message:
                              "add everything that is included in the price   ",
                          child: Icon(
                            Icons.info_outline,
                            color: const Color.fromARGB(255, 27, 124, 235),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          gapH16,
           SizedBox(
                width: 350,
                child: MultiSelectDropDown(
                  clearIcon: Icon(Icons.clear),
                  onOptionSelected: (options) {
                    setState(() {
                       _includecontrollerss = options.map((item) => item.label).toList();
                      //print(suitableOptions);
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
            gapH18,
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ... _includetextFields,
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                          onTap: _addIncludesTextField,
                          child: Container(
                            child: InkWell(
                                child: Center(
                                    child: Text(
                              "Custemize your own Includes ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            ))),
                          )),
                    ),
                  ],
                ),
              ),
              gapH18,
            ],
          ),
               Wrap(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "What is Not included ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 14, 64, 122),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            //font fam to add later
                          ),

                          softWrap:
                              true, // Allows the text to wrap to the next line
                        ),
                        Tooltip(
                          padding: EdgeInsets.all(20),
                          message:
                              "add everything that is Not  included in the price  , so custumers can evaluate your price , click on add includes when you want to start a new one   ",
                          child: Icon(
                            Icons.info_outline,
                            color: const Color.fromARGB(255, 27, 124, 235),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          gapH14,
         SizedBox(
                width: 350,
                child: MultiSelectDropDown(
                  clearIcon: Icon(Icons.clear),
                  onOptionSelected: (options) {
                    setState(() {
                      _notincludecontrollerss = options.map((item) => item.label).toList();
                      print(_includetextFields);
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

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ... _notincludetextFields,
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                          onTap:  _addNotIncludesTextField,
                          child: Container(
                            child: InkWell(
                                child: Center(
                                    child: Text(
                              "Custemize your own not includes  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            ))),
                          )),
                    ),
                  ],
                ),
              ),
              gapH18,
            ],
          ),
          
           Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _saveDraft,
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
           gapH2,
           gapH20,
           gapH20,
          ],
        ),
      )),
    );
  }
  
List<String> include = [];
List<String> notinclude = [];
List<String> existingNotIncludess = [];
  Future<void> _saveDraft() async {
  
// Clear the existing lists
  // Clear the existing lists
  include.clear();
  notinclude.clear();
 // existingNotIncludess.clear();

  // Add current text field values to their respective controller lists
  if (_includes.text.isNotEmpty) {
    _includecontrollers.add(_includes);
  }
  if (_notincludes.text.isNotEmpty) {
    _notincludecontrollers.add(_notincludes);
  }

  // Clear the temporary sets
  Set<String> existingIncludes = {};
  Set<String> existingNotIncludes = {};

  // Add unique non-empty text from _includecontrollers to include
  for (var controller in _includecontrollers) {
    String text = controller.text.trim();
    if (text.isNotEmpty && !existingIncludes.contains(text)) {
      existingIncludes.add(text);
      include.add(text);
    }
  }

  // Add unique non-empty text from _notincludecontrollers to notinclude
  for (var controller in _notincludecontrollers) {
    String text = controller.text.trim();
    if (text.isNotEmpty && !existingNotIncludes.contains(text)) {
      existingNotIncludes.add(text);
      notinclude.add(text);
    }
  }

  // Ensure the main text fields are added if they are unique
  if (_includes.text.isNotEmpty && !existingIncludes.contains(_includes.text.trim())) {
    include.add(_includes.text.trim());
    existingIncludes.add(_includes.text.trim());
  }
  if (_notincludes.text.isNotEmpty && !existingNotIncludes.contains(_notincludes.text.trim())) {
    notinclude.add(_notincludes.text.trim());
    existingNotIncludes.add(_notincludes.text.trim());
  }

  // Add unique non-empty values from existingNotIncludes to existingNotIncludess
  existingNotIncludess.addAll(existingNotIncludes);

  // Add unique non-empty values from existingNotIncludess to include
  for (String text in existingNotIncludess) {
    if (!include.contains(text)) {
      include.add(text);
    }
  }

  print('Include: $include'); // Print include list
  print('Not Include: $notinclude'); // P

    Map<String, dynamic> data = {
      'destination': destinationcontroller.text,
      'region' : arraivel,
      'wilaya':wilaya,
      'includes':   include.join(','),
      'notincludes':  _notincludecontrollerss.join(','),
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draft.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draft.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');
  }

  Future<void> _loadDraft() async {
    Map<String, dynamic> data = await  Draft.loadDraft(widget.draftid, ['destination', 'includes', 'notincludes']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
       destinationcontroller.text = data['destination'];
       include = data['includes'].split(',');
      notinclude = data['notincludes'].split(',');
    });
  }


  void iconOnPressed() {}

  void RemoveincludeTextField() {
    if (_includetextFields.isNotEmpty) {
      _includetextFields.removeLast(); // Remove the last text field
       _includecontrollers.removeLast(); // Remove the corresponding controller
    }
    setState(() {});
  }
   void RemovenotincludeTextField() {
    if ( _notincludetextFields.isNotEmpty) {
      _notincludetextFields.removeLast(); // Remove the last text field
      _notincludecontrollers.removeLast(); // Remove the corresponding controller
    }
    setState(() {});
  }
  void icononpressed() {}
  nextMethod() {
    // ignore: prefer_const_constructors
    _saveDraft();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>   ActivityPageFive(draftid: widget.draftid,)));
  }
}

