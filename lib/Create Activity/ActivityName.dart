import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';

class ActivityName extends StatefulWidget {
  ActivityName({super.key});

  @override
  State<ActivityName> createState() => _ActivityNameState();
}

class _ActivityNameState extends State<ActivityName> {
  TextEditingController NameController = TextEditingController();
  TextEditingController DescController = TextEditingController();
  TextEditingController HighlightOneColtroller = TextEditingController();
  TextEditingController HighlightTwoColtroller = TextEditingController();
  TextEditingController HighlightThreeColtroller = TextEditingController();
  final List<TextEditingController> _controllers = [];
  final List<Widget> _textFields = [];

  @override
  void dispose() {
    // Dispose of all the controllers when the widget is disposed
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTextField() {
    final controller = TextEditingController();
    _controllers.add(controller);
   /* _textFields.add(
     SizebaleTextfield(
        controller: controller,
        sizefield: 1,
        max: 80,
        hintText: "Highlight",
        iconVisible: true,
        iconOnPressed: RemoveTextField,
      ),
    );*/

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int NameCount = 0;

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
        child: Column(children: [
          HorizontalTimeline(
            index: 1,
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
                          "what is the title of your activity  ",
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
                              "What is the costumer facing name , make sure to include a comprehensive name ",
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
              controller: NameController,
              sizefield: 1,
              max: 20,
              hintText: "Enter name",
              iconVisible: false,
              iconOnPressed: icononpressed),*/
          // gapH16,
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
                          "Decribe your activity ",
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
                              "write a descrtion of your activity so the costuner know what to expect ",
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
              controller: DescController,
              sizefield: 4,
              max: 500,
              hintText: "Decription...",
              iconVisible: false,
              iconOnPressed: icononpressed),*/
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
                          "Summerize Highlights ",
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
                              "Summerize you activity in highlights so the costumer can see what ot expct , add other highlights if needed   ",
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
              controller: HighlightOneColtroller,
              sizefield: 1,
              max: 80,
              hintText: "Highlight",
              iconVisible: false,
              iconOnPressed: icononpressed),
          SizebaleTextfield(
              controller: HighlightTwoColtroller,
              sizefield: 1,
              max: 80,
              hintText: "Highlight",
              iconVisible: false,
              iconOnPressed: icononpressed),
          SizebaleTextfield(
            controller: HighlightThreeColtroller,
            sizefield: 1,
            max: 80,
            hintText: "Highlight",
            iconVisible: false,
            iconOnPressed: icononpressed,
          ),*/

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ..._textFields,
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                          onTap: _addTextField,
                          child: Container(
                            child: InkWell(
                                child: Center(
                                    child: Text(
                              "Add Highlight",
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
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 150, child: sigin(onTap: nextMethod, btntext: "Next")),
          )
        ]),
      )),
    );
  }

  void RemoveTextField() {
    if (_textFields.isNotEmpty) {
      _textFields.removeLast(); // Remove the last text field
      _controllers.removeLast(); // Remove the corresponding controller
    }
    setState(() {});
  }

  void icononpressed() {}
  nextMethod() {
    // ignore: prefer_const_constructors
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ActivityCategory()));
  }
}
