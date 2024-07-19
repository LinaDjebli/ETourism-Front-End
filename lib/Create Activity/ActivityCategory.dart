import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/Selectitem.dart';
import 'package:tro/Create Activity/ActivityName.dart';
import 'package:tro/Create%20Activity/Draft.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/Authentification/signin.dart';
import 'package:uuid/uuid.dart';



class ActivityCategory extends StatefulWidget {

 
 ActivityCategory({super.key}  );

  @override
  State<ActivityCategory> createState() => _ActivityCategoryState();
}

class _ActivityCategoryState extends State<ActivityCategory> {
  bool isSelected = false;
  bool isnature = false;
  bool issport = false;
  bool isculture = false;
  int _selectedValue = 0;
  String draftId = '';
  @override
  void initState() {
    super.initState();
    if (draftId.isEmpty) {
      draftId = generateDraftId();
      addDraftId(draftId);
    }
    _loadDraft();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Category",
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
              index: 0,
            ),
            gapH16,
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Activity Category ",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    //font fam to add later
                  ),
                ),
              ],
            ),
            gapH16,
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Which category your activity belongs to ?  ",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    //font fam to add later
                  ),
                ),
              ],
            ),
            gapH4,
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "help us categorise your activity so costumers   ",
                  style: TextStyle(
                   color: Color.fromARGB(255, 148, 148, 148),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    
                    //font fam to add later
                  ),
                  softWrap: true,
                ),
                Text(
                  "find it eaiser ",
                  style: TextStyle(
                   color: Color.fromARGB(255, 148, 148, 148),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    
                    //font fam to add later
                  ),
                  softWrap: true,
                ),
              ],
            ),
            gapH12,
           
            gapH16,
            SizedBox(
              width: 390,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    height: 120,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                          issport = true;
                          isculture = false;
                          isnature = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              isSelected && issport && !isnature && !isculture
                                  ? Colors.blue // Change color when selected
                                  : Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: isSelected &&
                                      issport &&
                                      !isnature &&
                                      !isculture
                                  ? Colors.blue
                                  : Color.fromARGB(255, 48, 80,
                                      102), // Change border color when selected
                              width: 2), // Increase border width when selected
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 2), // shadow direction: bottom
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  const Offset(0, -2), // shadow direction: top
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  "lib/photos/tennis_8262981.png",
                                  height: 60,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              " Sports",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  gapW12,
                  SizedBox(
                    width: 110,
                    height: 120,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                          issport = false;
                          isnature =  false;
                          isculture =  true ;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color:
                              isSelected &&  isculture && !isnature  && !issport
                                  ? Colors.blue // Change color when selected
                                  : Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color:  isSelected &&  isculture && !isnature  && !issport
                                  ? Colors.blue
                                  : Color.fromARGB(255, 48, 80,
                                      102), // Change border color when selected
                              width: 2), // Increase border width when selected
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 2), // shadow direction: bottom
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  const Offset(0, -2), // shadow direction: top
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  "lib/photos/Capture_d_écran_2024-05-17_211349-removebg-preview.png",
                                  height: 60,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              " Culture",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  gapW12,
                  SizedBox(
                    width: 110,
                    height: 120,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                          issport = false;
                          isnature =  true;
                          isculture =  false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color:
                              isSelected &&  isnature && !isculture  && !issport
                                  ? Colors.blue // Change color when selected
                                  : Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color:  isSelected &&  isnature && !isculture  && !issport
                                  ? Colors.blue
                                  : Color.fromARGB(255, 48, 80,
                                      102), // Change border color when selected
                              width: 2), // Increase border width when selected
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 2), // shadow direction: bottom
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  const Offset(0, -2), // shadow direction: top
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  "lib/photos/forest.png",
                                  height: 60,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Nature",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH16,
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  " What is the type of your activity ?  ",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 17,
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
                        "Select the type that describes your activity the best ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontSize: 14,
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
            gapH14,
            Column(
              children: <Widget>[
                RadioListTile(
                
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Outdours'),Text("out in the nature activies like hiking ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                Divider(),
                RadioListTile(
                  
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Tour'),Text("guided tour aroud a city or trip ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                Divider(),
                RadioListTile(
                  
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Club Activites'),Text("Activities provided in clubs ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 3,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                Divider(),
                RadioListTile(
                 
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Attraction Tickit'),Text("an entary to a landspace or a park ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 4,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                 Divider(),
                RadioListTile(
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Museum Visit'),Text("guided visit to a specific museum", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 5,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                //Text("like tour in a city", style: TextStyle(fontSize: 12 , color: Colors.grey),),
                Divider(),
                RadioListTile(
                 
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Cultural Experience'),Text("guided tours related to cultural activities like cultural dance ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 6,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                 Divider(),
                RadioListTile(
                 
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Winter Activites'),Text("Winter realted Activites like Skiing/Snowboarding", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 7,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                 
                 Divider(),
                RadioListTile(
                 
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('summer Activities '),Text("Beatch Related Activites like Kayaking/Canoeing  ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 8,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                 Divider(),
                RadioListTile(
                 
                  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Festival  '),Text("Festival like a concsert ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                  value: 9,
                  
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
              ],
            ),

            gapH20,
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
  

 Future<void> _saveDraft() async {
   int category = 0 ; 
   if( isSelected && issport && !isnature && !isculture){
     category = 1 ;
     
   }else if ( isSelected &&  isculture && !isnature  && !issport){
    category = 2;
   }else if ( isSelected &&  isnature && !isculture  && !issport){
    category = 3;
   }
  String type = ''; 
  if( _selectedValue == 1){
    type = 'Outdours';
   
  }else if(_selectedValue == 2){
    type = 'Tour';
  }else if(_selectedValue == 3){
    type = 'Club Activites';
  }else if(_selectedValue == 4){
    type = 'Attraction Tickit';
  }else if(_selectedValue == 5){
    type = 'Museum Visit';
  }else if(_selectedValue == 6){
    type = 'Cultural Experience';
  }else if(_selectedValue == 7){
    type = 'Winter Activites';
  }else if(_selectedValue == 8){
    type = 'summer Activities';
  }else if(_selectedValue == 9){
    type = 'Festival';
  }
    Map<String, dynamic> data = {
      'category': category,
      'type': type,
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await saveDraft(draftId, data);
  }

  Future<void> _loadDraft() async {
    int category = 0 ; 
   if( isSelected && issport && !isnature && !isculture){
     category = 1 ;
     
   }else if ( isSelected &&  isculture && !isnature  && !issport){
    category = 2;
   }else if ( isSelected &&  isnature && !isculture  && !issport){
    category = 3;
   }
  String type = ''; 
  if( _selectedValue == 1){
    type = 'Outdours';
   
  }else if(_selectedValue == 2){
    type = 'Tour';
  }else if(_selectedValue == 3){
    type = 'Club Activites';
  }else if(_selectedValue == 4){
    type = 'Attraction Tickit';
  }else if(_selectedValue == 5){
    type = 'Museum Visit';
  }else if(_selectedValue == 6){
    type = 'Cultural Experience';
  }else if(_selectedValue == 7){
    type = 'Winter Activites';
  }else if(_selectedValue == 8){
    type = 'summer Activities';
  }else if(_selectedValue == 9){
    type = 'Festival';
  }
  print(category);
 print(type);
  // Add a sligh
    Map<String, dynamic> data = await loadDraft(draftId, ['category', 'type']);
    setState(() {
      category = data['category'];
      type = data['type'];
    });
  }
  nextMethod() {
    _saveDraft();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ActivityName( draftid: draftId,)));
  // Add a slight delay to ensure print statements are executed
   
  }
  
}
