import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
//import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/Create%20Activity/ActivityLocation.dart';
import 'package:tro/Create%20Activity/Draft.dart' as  Draft; 
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';

class ActivityName extends StatefulWidget {
  String draftid ; 
   
  ActivityName({super.key , required this.draftid});
//int id_category ; 
//String type ; 
  @override
  State<ActivityName> createState() => _ActivityNameState();
}

class _ActivityNameState extends State<ActivityName> {
  TextEditingController NameController = TextEditingController();
  TextEditingController DescController = TextEditingController();
  TextEditingController HighlightOneColtroller = TextEditingController();
  TextEditingController HighlightTwoColtroller = TextEditingController();
  TextEditingController HighlightThreeColtroller = TextEditingController();
  List<TextEditingController> _controllers = [];
  final List<Widget> _textFields = [];

  @override
  void dispose() {
    // Dispose of all the controllers when the widget is disposed
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
 @override
  void initState() {
    super.initState();
    _loadDraft();
  }
  void _addTextField() {
    final controller = TextEditingController();
    _controllers.add(controller);
    _textFields.add(
     SizebaleTextfield(
        controller: controller,
        sizefield: 1,
        max: 80,
        hintText: "Highlight",
        iconVisible: true,
        iconOnPressed: RemoveTextField,errortext: '', eroorcond:  true , onChanged: (String ) {  },
      ),
    );

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
                      "Activity Title ",
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
                                waitDuration: Duration(seconds: 1),
                    showDuration: Duration(seconds: 10),
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
          SizebaleTextfield(
              controller: NameController,
              sizefield: 1,
              max: 20,
              hintText: "Enter name",
              iconVisible: false,
              iconOnPressed: icononpressed, errortext: '', eroorcond: true, onChanged: (String ) {  },),
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
          SizebaleTextfield(
              controller: DescController,
              sizefield: 4,
              max: 500,
              hintText: "Decription...",
              iconVisible: false,
              iconOnPressed: icononpressed, errortext: '', eroorcond: true, onChanged: (String ) {  },),
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
         SizebaleTextfield(
              controller: HighlightOneColtroller,
              sizefield: 1,
              max: 80,
              hintText: "Highlight",
              iconVisible: false,
              iconOnPressed: icononpressed, errortext: '', eroorcond:  true , onChanged: (String ) { },),
          SizebaleTextfield(
              controller: HighlightTwoColtroller,
              sizefield: 1,
              max: 80,
              hintText: "Highlight",
              iconVisible: false,
              iconOnPressed: icononpressed,errortext: '', eroorcond:  true , onChanged: (String ) {  },),
          SizebaleTextfield(
            controller: HighlightThreeColtroller,
            sizefield: 1,
            max: 80,
            hintText: "Highlight",
            iconVisible: false,
            iconOnPressed: icononpressed,
          errortext: '', eroorcond:  true , onChanged: (String ) {   },),

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
             Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:  _saveDraft,
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
         gapH12
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
  List<String> highlites = [] ;
Future<void> _saveDraft() async {
  

   _controllers.add(HighlightOneColtroller);
   _controllers.add(HighlightTwoColtroller);
   _controllers.add(HighlightThreeColtroller);

 highlites.clear();

  // Add non-empty highlight fields to the highlites list
   Set<String> existingHighlights = {};

  // Add existing highlights to set to check for duplicates
  for (var controller in _controllers) {
    String text = controller.text.trim();
    if (text.isNotEmpty) {
      if (!existingHighlights.contains(text)) {
        highlites.add(text);
        existingHighlights.add(text);
      }
    }
  }

  // Add highlights from text fields
  if (HighlightOneColtroller.text.isNotEmpty &&
      !existingHighlights.contains(HighlightOneColtroller.text.trim())) {
    highlites.add(HighlightOneColtroller.text.trim());
    existingHighlights.add(HighlightOneColtroller.text.trim());
  }
  if (HighlightTwoColtroller.text.isNotEmpty &&
      !existingHighlights.contains(HighlightTwoColtroller.text.trim())) {
    highlites.add(HighlightTwoColtroller.text.trim());
    existingHighlights.add(HighlightTwoColtroller.text.trim());
  }
  if (HighlightThreeColtroller.text.isNotEmpty &&
      !existingHighlights.contains(HighlightThreeColtroller.text.trim())) {
    highlites.add(HighlightThreeColtroller.text.trim());
    existingHighlights.add(HighlightThreeColtroller.text.trim());
  }

    Map<String, dynamic> data = {
      'title': NameController.text,
      'description':  DescController .text,
      'highlights': highlites.join(','),
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draft.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draft.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');
  }

  Future<void> _loadDraft() async {
    Map<String, dynamic> data = await  Draft.loadDraft(widget.draftid, ['title', 'description', 'highlights']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
       NameController.text = data['title'];
      DescController .text = data['description'];
      highlites = data['highlights'].split(',');
    });
  }
  void icononpressed() {}
  nextMethod() {
_saveDraft();
    
    // ignore: prefer_const_constructors
    Navigator.push(
        
        context, MaterialPageRoute(builder: (context) =>  ActivityLocation(draftid: widget.draftid,)));
  }
}
