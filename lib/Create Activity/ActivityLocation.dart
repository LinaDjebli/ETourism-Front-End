import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:link_text/link_text.dart';
import 'package:tro/Componants/List_Of_States.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';

class ActivityLocation extends StatefulWidget {
  const ActivityLocation({super.key});

  @override
  State<ActivityLocation> createState() => _ActivityLocationState();
}

class _ActivityLocationState extends State<ActivityLocation> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    TextEditingController FeaturesColtroller = TextEditingController();
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
            gapH28,
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
                            "what is included ",
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
                                "List All features that are included in the price ",
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
           /* SizebaleTextfield(
              eroorcond: true,

                controller: FeaturesColtroller,
                sizefield: 3,
                max: 60,
                hintText: "Features included",
                iconVisible: false,
                iconOnPressed: iconOnPressed),*/
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
                            "what is not included ",
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
                                "List All features that are not included in the price ",
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
          /*  SizebaleTextfield(
                controller: FeaturesColtroller,
                sizefield: 3,
                max: 60,
                hintText: "Features not included",
                iconVisible: false,
                iconOnPressed: iconOnPressed),*/
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

  void iconOnPressed() {}
}
