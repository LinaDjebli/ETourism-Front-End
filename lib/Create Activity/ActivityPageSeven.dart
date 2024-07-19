import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SelectButton.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/Text&Field.dart';
import 'package:tro/Create%20Activity/ActivityPageEight.dart';
import 'package:tro/Create%20Activity/Draft.dart'as Drafts;
import 'package:tro/constants/Size.dart';

class ActivityPageSeven extends StatefulWidget {
    String draftid ;
   ActivityPageSeven({super.key, required this.draftid});

  @override
  State<ActivityPageSeven> createState() => _ActivityPageSevenState();
}

class _ActivityPageSevenState extends State<ActivityPageSeven> {
  List<String> _imagePaths = [];
  List<String> selectedItems = [];
  bool _isDataValide = true;
  int SlectedFood = 0;
  bool showExample = false;
  int SelectedTransport = 0;
  String errordescription = "please fill this field";

  void _validateDate(String value) {
    if (datecontroller.text.isNotEmpty) {
      setState(() {
        _isDataValide = true;
      });
    }
  }

  TextEditingController datecontroller = TextEditingController();
  FocusNode _Focusenode = FocusNode();
  TextEditingController deteofbirth = TextEditingController();

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
              HorizontalTimeline(index: 5),
              Wrap(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Photos ",
                          style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              gapH18,
              gapH18,
              gapH18,
              gapH18,
              TextandField(
                tooltipText: "",
                Text: "Add photos  ",
                TextSize: 19,
              ),
              Wrap(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Images help customers visualize joining your activity and can manage expectations about crowds, group size, vehicle types, and more.                                              you need to add four photos ,                                         you can tap on an imageto change it   ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 94, 94, 94),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              gapH2,
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(108, 73, 72, 72),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Add Four Photos to your activity",
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          IconButton(
                            onPressed: _imagePaths.length < 4 ? selectImage : null,
                            icon: Icon(Icons.add_a_photo),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imagePaths.asMap().entries.map((entry) {
                    int index = entry.key;
                    String path = entry.value;
                    return GestureDetector(
                      onTap: () => changeImage(index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          File(path),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              gapH12,
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: nextMethod,
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
            ],
          ),
        ),
      ),
    );
  }

  nextMethod() {
    _saveDraft();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityPageEight(draftid: widget.draftid,),
      ),
    );
  }

  void selectImage() async {
    final pickedFile = await pickImage(ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (_imagePaths.length < 4) {
          _imagePaths.add(pickedFile.path);
        }
      });
    }
  }

  void changeImage(int index) async {
    final pickedFile = await pickImage(ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePaths[index] = pickedFile.path;
        print(_imagePaths);
      });
    }
  }

  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    
    return await _imagePicker.pickImage(source: source);
    
  }
  Future<void> _saveDraft() async {
  
    Map<String, dynamic> data = {
      'images': _imagePaths.join(','),
      
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Drafts.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Drafts.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');
  }

  Future<void> _loadDraft() async {
    Map<String, dynamic> data = await  Drafts.loadDraft(widget.draftid, ['images' ]);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
        _imagePaths= data['images'].split(',');
       
    });
  }
}
