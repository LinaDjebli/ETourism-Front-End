 
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SelectButton.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/Text&Field.dart';
import 'package:tro/Create%20Activity/ActivityPageEight.dart';
import 'package:tro/Create%20Activity/Draft.dart' as Draftv;
import 'package:tro/constants/Size.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tro/globals.dart';
import 'package:tro/modules/activity.dart';
import 'dart:convert';
 
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tro/modules/activity.dart';
import 'package:tro/modules/client.dart';
import 'package:tro/modules/agency.dart';
import 'package:tro/modules/guide.dart';
import 'package:tro/constants/Size.dart';  
import 'package:dio/dio.dart';
import 'package:tro/navigateur.dart';    // Import your constants file


class Category {
  String type;
  int customerNumber;
  double price;

  Category({required this.type, required this.customerNumber, required this.price});
}
class ActivityPagenine extends StatefulWidget {
  String? userid;
   String draftid;
   ActivityPagenine({super.key , required this.draftid , this.userid});

  @override
  State<ActivityPagenine> createState() => _ActivityPagenineState();
}

class _ActivityPagenineState extends State<ActivityPagenine> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    categories.add(Category(type: "", customerNumber: 1, price: 0)); // Add an initial category
  }

   int dropdownValue = options.first;
 List<TimeOfDay> selectedTimes = [
    TimeOfDay(hour: 10, minute: 47),
    TimeOfDay(hour: 10, minute: 47),
  ];
  static const List<int> options = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
  ];


  List<Widget> categoryRows = [];

   int  Selectedtype = 0;
   int SelectPrice = 0 ; 
    TextEditingController startdatecontroller = TextEditingController();
     TextEditingController enddatecontroller = TextEditingController();
    TextEditingController _controller = TextEditingController();
    TextEditingController singlepricecontroller = TextEditingController();
    TextEditingController pricecontroller= TextEditingController();
     final List<TextEditingController> _controllers = [];
  final List<Widget> _textFields = [];
  double _counterValue = 0 ; 
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
    _textFields.add(
     Column(
       children: [
         Row(children: [
          SizedBox(
           width: 120,
           height: 50,
            child: MultiSelectDropDown(
             //borderWidth: 2,
            
                      clearIcon: Icon(Icons.clear),
                      onOptionSelected: (options) {
                        debugPrint(options.toString());
                      },
                      options: const <ValueItem>[
                        ValueItem(label: 'Option 1', value: '1'),
                        ValueItem(label: 'Option 2', value: '2'),
                        ValueItem(label: 'Option 3', value: '3'),
                        ValueItem(label: 'Option 4', value: '4'),
                        ValueItem(label: 'Option 5', value: '5'),
                        ValueItem(label: 'Option 6', value: '6'),
                      ],
                      maxItems: 7,
                      disabledOptions: const [
                        ValueItem(label: 'Option 1', value: '1')
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
                      hint: "Minutes",
                      
                    ),
         
         
          ),
         
         
            
          
         ],),


        
       ],
     )
     
    );

    setState(() {});
  }
  void RemoveTextField() {
    if (_textFields.isNotEmpty) {
      _textFields.removeLast(); // Remove the last text field
      _controllers.removeLast(); // Remove the corresponding controller
    }
    setState(() {});
  }
     bool _isDataValide= true ;
     void _validateDate(String value) {
  if( startdatecontroller.text.isNotEmpty ){
    setState(() {
       _isDataValide = true ; 
    });
  }}
  FocusNode _Focusenode = FocusNode();
  @override
  Widget build(BuildContext context) {
   
    var UrlCotroller;
      int dropdownValue = options.first;
    return  Scaffold(
      
      backgroundColor: Colors.white,
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
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [

 
              HorizontalTimeline(
                index: 6,
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
                          "Availibility and pricing  ",
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


              TextandField(
                tooltipText: "",
                Text: "what type of activity you provide ",
                TextSize: 19,
              ),
 Column(children: <Widget>[
              RadioListTile(
                title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ gapH12,Text('Daily Activity '),Text("Select at what time your activity starts and ends  ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                value: 1,
                groupValue: Selectedtype,
                onChanged: (value) {
                  setState(() {
                    Selectedtype = value as int;
                  });
                }
              ),
               if(Selectedtype ==1)...{
                   Row(
    
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: [
       gapW12,
        Text("Start Time"),
        gapW20,
           
  
     SizedBox(
      height: 110,
       child: Column(children: [
        gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(60, 40),
          ),
          
                onPressed: () => _selectTime(context,0),
                child: Text('Select Time'),
              ),
         Text(
                "Selected Time: ${selectedTimes[0].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
  
        
   ],),
 gapH14,

               Row(
    
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: [
       gapW12,
        Text("Start Time"),
        gapW20,
           
  
     SizedBox(
      height: 110,
       child: Column(children: [
        gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(60, 40),
          ),
          
                onPressed: () => _selectTime(context,1),
                child: Text('Select Time'),
              ),
         Text(
                "Selected Time: ${selectedTimes[1].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
  
        
   ],),
              },
              gapH18,
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ gapH12,Text('Specific Duration Activity  '),Text("Select at when the Activity Start and at what Hour and when it ends  ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                value: 2,
                groupValue: Selectedtype,
                onChanged: (value) {
                  setState(() {
                    Selectedtype = value as int;
                  });
                },
              ),
              if(Selectedtype ==2)...{


                TextandField(Text: "Start Date ",tooltipText: "",TextSize: 16,),
                   Row(
    
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: [
       
                    SizedBox(
                      
                      width: 200,
                      child: Padding(
                            padding: const EdgeInsets.all(12),
                            
                            child: TextField(
                              
                              focusNode: _Focusenode,
                              controller:startdatecontroller,
                              
                              decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                      ),
                                      hintText: " yyyy/mm/dd",
                                      errorText: _isDataValide? null :"enter a valide  date ",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                        BorderSide(color: Color.fromARGB(108, 167, 165, 165),),
                                        borderRadius:
                        BorderRadius.circular(10.0), // Set borderRadius here
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                        BorderSide(color: Color.fromARGB(108, 255, 255, 255)),
                                        borderRadius:
                        BorderRadius.circular(10.0), // Set borderRadius here
                                      ),
                                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                                      filled: true,
                              ),
                              // readOnly: true,
                               onTap: () async {
                        _Focusenode.requestFocus();
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025),
                        );
                      
                        if (pickedDate != null) {
                          setState(() {
                            startdatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      }
                            ),
                          ),
                    ),   
   Text("AT "),
    gapW4,
     gapW4,
     SizedBox(
      height: 110,
       child: Column(children: [
         
         gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(60, 40),
          ),
          
                onPressed: () => _selectTime(context,0),
                child: Text('Select Time'),
              ),
         Text(
                "Selected Time: ${selectedTimes[0].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
     
            
    gapW12,
        
   ],),

   
 gapH20,

 TextandField(tooltipText:  "", Text: "end date", TextSize: 16),
    Row(
    
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
   children: [
       
                    SizedBox(
                      
                      width: 200,
                      child: Padding(
                            padding: const EdgeInsets.all(12),
                            
                            child: TextField(
                              
                              focusNode: _Focusenode,
                              controller: enddatecontroller,
                              
                              decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                      ),
                                      hintText: " yyyy/mm/dd",
                                      errorText: _isDataValide? null :"enter a valide  date ",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                        BorderSide(color: Color.fromARGB(108, 167, 165, 165),),
                                        borderRadius:
                        BorderRadius.circular(10.0), // Set borderRadius here
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                        BorderSide(color: Color.fromARGB(108, 255, 255, 255)),
                                        borderRadius:
                        BorderRadius.circular(10.0), // Set borderRadius here
                                      ),
                                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                                      filled: true,
                              ),
                              // readOnly: true,
                               onTap: () async {
                        _Focusenode.requestFocus();
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025),
                        );
                      
                        if (pickedDate != null) {
                          setState(() {
                            enddatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      }
                            ),
                          ),
                    ),   
   Text("AT "),
    gapW4,
     gapW4,
     SizedBox(
      height: 110,
       child: Column(children: [
        gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(65, 40),
          ),
          
                onPressed: () => _selectTime(context,1),
                child: Text('Select Time'),
              ),
              
         Text(
                "Selected Time: ${selectedTimes[1].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
     
            
    gapW12,
        
   ],),

 gapH20,
                  
              },
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ gapH12,Text('One day Activity  '),Text("Select the Date of the Activity and when it starts and ends  ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                value: 3,
                groupValue: Selectedtype,
                onChanged: (value) {
                  setState(() {
                    Selectedtype = value as int;
                  });
                },
              ),
               if(Selectedtype ==3)...{
Text("Select the date of the activity "),
                 SizedBox(
                      
                      width: 200,
                      child: Padding(
                            padding: const EdgeInsets.all(12),
                            
                            child: TextField(
                              
                              focusNode: _Focusenode,
                              controller: startdatecontroller,
                              
                              decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                      ),
                                      hintText: " yyyy/mm/dd",
                                      errorText: _isDataValide? null :"enter a valide birth date ",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                        BorderSide(color: Color.fromARGB(108, 167, 165, 165),),
                                        borderRadius:
                        BorderRadius.circular(10.0), // Set borderRadius here
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                        BorderSide(color: Color.fromARGB(108, 255, 255, 255)),
                                        borderRadius:
                        BorderRadius.circular(10.0), // Set borderRadius here
                                      ),
                                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                                      filled: true,
                              ),
                              // readOnly: true,
                               onTap: () async {
                        _Focusenode.requestFocus();
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025),
                        );
                      
                        if (pickedDate != null) {
                          setState(() {
                            startdatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      }
                            ),
                          ),
                    ), 
                    Text("Select when your activity starts and ends "),
                    Row(
    
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: [
      gapW14,
       gapW14,
        gapW14,
         gapW14,
           
    SizedBox(
      height: 110,
       child: Column(children: [
         gapH28,
        ElevatedButton(
         
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(65, 40),
          ),
          
                onPressed: () => _selectTime(context,0),
                child: Text('Select Time'),
              ),
              
         Text(
                "Selected Time: ${selectedTimes[0].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
gapW12,Text("To"),gapW12,
 SizedBox(
      height: 110,
       child: Column(children: [
         gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(65, 40),
          ),
          
                onPressed: () => _selectTime(context,1),
                child: Text('Select Time'),
              ),
              
         Text(
                "Selected Time: ${selectedTimes[1].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
 
  
   ],),
   
              },

               SizedBox(width: 350, child: Divider()),
              RadioListTile(
                 title:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ gapH12,Text('Weekly Activity  '),Text("Select the Days that your activity is open and at what hour ", style: TextStyle(fontSize: 12 , color: Colors.grey),),],),
                value: 4,
                groupValue: Selectedtype,
                onChanged: (value) {
                  setState(() {
                    Selectedtype = value as int;
                  });
                },
              ),
               if(Selectedtype ==4)...{
                        Row(
    
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: [
      gapW14,
       gapW14,
        gapW14,
         gapW14,
           
    SizedBox(
      height: 110,
       child: Column(children: [
         gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(65, 40),
          ),
          
                onPressed: () => _selectTime(context,0),
                child: Text('Select Time'),
              ),
              
         Text(
                "Selected Time: ${selectedTimes[0].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
gapW12,Text("To"),gapW12,
 SizedBox(
      height: 110,
       child: Column(children: [
         gapH28,
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
                              
                              
                              foregroundColor: Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              shadowColor: const Color.fromARGB(255, 78, 78, 78),
                              disabledBackgroundColor:Colors.white,
                              surfaceTintColor: Colors.white,
                              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              minimumSize: Size(65, 40),
          ),
          
                onPressed: () => _selectTime(context,1),
                child: Text('Select Time'),
              ),
              
         Text(
                "Selected Time: ${selectedTimes[1].format(context)}",
              ),
              SizedBox(height: 16),
       ],),
     ),
 
  
   ],),

   DaysOfWeekCheckbox()
              },
            ]),

            gapH32,
 TextandField(
                tooltipText: "",
                Text: "what Pricing you provide  ",
                TextSize: 19,
              ),

              Column(children: <Widget>[
              RadioListTile(
                title: Text('The price is the same for everyone, eg: per participant '),
                value: 1,
                groupValue: SelectPrice,
                onChanged: (value) {
                  setState(() {
                    SelectPrice = value as int;
                  });
                },

              ),
               if (SelectPrice == 1) ...{

                Row(
                  children: [
                    gapW12,
                    gapW12,
                    Container(
                      alignment: Alignment.centerLeft,
                      child:SizedBox(width: 150,
                    
                      child:  TextField( controller: singlepricecontroller,decoration: InputDecoration(
              hintText: 'Price',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey,  // Change the border color as needed
                  width: 2.0,  // Change the border width as needed
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
                    ), ),),
                      gapW14,
                      Text("DA",style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  ],
                )
                
               
              },
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title: Text('Price depends on age, eg: adults, child, senior, etc'),
                value: 2,
                groupValue: SelectPrice,
                onChanged: (value) {
                  setState(() {
                    SelectPrice = value as int;
                  });
                  
                 

                },
              ),
              if(SelectPrice == 2)...{
 
            
   Column(
     children: [
      Row(children: [ gapW14,gapW14,gapW14, Text("Type",style: TextStyle(fontSize: 15),), gapW14,gapW14,gapW14,gapW12,Text("Number of costumer",style: TextStyle(fontSize: 15),),gapW12,gapW14,Text("Price in DA ",style: TextStyle(fontSize: 15),)],),
      gapH12,
       Row(
                      children: [
                        gapW12,
                 
                      ],
                    ),
                    ListView.builder(
              shrinkWrap: true,
              itemCount: categoryRows.length,
              itemBuilder: (context, index) {
                return categoryRows[index];
              },
            ), 
            Column(
          children: categories.asMap().entries.map((entry) {
            int index = entry.key;
            Category category = entry.value;
            return CategoryRow(
              category: category,
              index: index,
              onCategoryChanged: _updateCategory,
            );
          }).toList(),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _addCategory,
              child: Text('Add Category'),
            ),
            SizedBox(width: 14),
            if (categories.isNotEmpty)
              ElevatedButton(
                onPressed: _removeCategory,
                child: Text('Remove Category'),
              ),
          ],
        ),
  ],
)
                 }
             
            ]),
            gapH32,
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
              child: Text("Finish"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background color
                onPrimary: Colors.white, // text color
              ),
            ),
          ],
        ),

            gapH64
          ],
        ),
      )),
    );
  }
Future<int> registerdailyAct(DailyActivty daily)async{
   try {
    final response = await http.post(
      Uri.parse('http://192.168.100.53:8000/api/daily-activity/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(daily),
    );

    if (response.statusCode == 201) {
      print('Activity registered successfully.');
      var responseData = jsonDecode(response.body);
      return responseData['activity_id'];
    } else {
      print('Failed to create activity: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to create activity: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error Type: ${e.runtimeType}');
    print('Error Message: $e');
    throw Exception('Failed to create activity: $e');
  }
} 
Future<int> registespecificdurationAct(SpecificDurationActivity specific)async{
   try {
    final response = await http.post(
      Uri.parse('http://192.168.100.53:8000/api/specific-duration-activity/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(specific),
    );

    if (response.statusCode == 201) {
      print('Activity registered successfully.');
      var responseData = jsonDecode(response.body);
      return responseData['activity_id'];
    } else {
      print('Failed to create activity: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to create activity: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error Type: ${e.runtimeType}');
    print('Error Message: $e');
    throw Exception('Failed to create activity: $e');
  }
} 
Future<int> registeronedayAct(OneDayActivity daily)async{
   try {
    final response = await http.post(
      Uri.parse('http://192.168.100.53:8000/api/one-day-activity/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(daily),
    );

    if (response.statusCode == 201) {
      print('Activity registered successfully.');
      var responseData = jsonDecode(response.body);
      return responseData['activity_id'];
    } else {
      print('Failed to create activity: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to create activity: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error Type: ${e.runtimeType}');
    print('Error Message: $e');
    throw Exception('Failed to create activity: $e');
  }
} 
Future<int?> registerWeeklyActivity(WeeklyActivity activity) async {
  final String url = 'http://192.168.100.53:8000/api/activities/';
  /*Dio dio = Dio();

  try {
    var response = await dio.post(
      url,
      data: jsonEncode(activity.toJson()),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 201) {
      print('Activity registered successfully.');
      int activityId = response.data['id']; // Extract the activity ID from the response
      return activityId;
    }  
  } catch (e) {
    print('Error: $e');
    return  null;
  }
   final response = await http.post(
    
    Uri.parse('http://192.168.100.53:8000/api/weekly-activity/'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(activity.toJson()),
  );

  if (response.statusCode == 201) {
     print('Activity registered successfully.');
    var responseData = jsonDecode(response.body);
    return responseData['activity_id'];
  } else {
    throw Exception('Failed to create activity');
  }*/
    try {
    final response = await http.post(
      Uri.parse('http://192.168.100.53:8000/api/weekly-activity/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(activity),
    );

    if (response.statusCode == 201) {
      print('Activity registered successfully.');
      var responseData = jsonDecode(response.body);
      return responseData['activity_id'];
    } else {
      print('Failed to create activity: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to create activity: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error Type: ${e.runtimeType}');
    print('Error Message: $e');
    throw Exception('Failed to create activity: $e');
  }
}
 

Future<void> uploadPhotos(int activityId, List<File?> images) async {
  var uri = Uri.parse('http://192.168.100.53:8000/api/upload-photos/$activityId/');

  for (var image in images) {
    if (image != null) {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('File', image.path));
      
      var response = await request.send();

      if (response.statusCode == 201) {
        print('Photo uploaded successfully: ${image.path}');
      } else {
        print('Failed to upload photo: ${image.path}');
        throw Exception('Failed to upload photo');
      }
    }
  }
}


 List<String> types = [] ; 
  List<int> customnumber = [] ;
  List<double> prices = [] ; 
  
  String timeOfDayToString(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  return dateTime.toIso8601String().substring(11, 16); // Format as HH:mm
  }
Future<void> _saveDraft() async {
  
if(Selectedtype==1){
 Map<String, dynamic> data = {
      'starthour':  timeOfDayToString(selectedTimes[0]),
      'endhour':  timeOfDayToString(selectedTimes[1]),
      
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftv.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftv.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');  


}else if(Selectedtype==2){
 Map<String, dynamic> data = {
      'activitydate':startdatecontroller.text,  
      'enddate':enddatecontroller.text, 
      'starthour':timeOfDayToString(selectedTimes[0]),
      'endhour': timeOfDayToString(selectedTimes[1]),
      
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftv.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftv.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');



}else if(Selectedtype == 3){
Map<String, dynamic> data = {
       'activitydate':startdatecontroller.text,
      'starthour':  timeOfDayToString(selectedTimes[0]),
      'endhour':  timeOfDayToString(selectedTimes[1]),
      
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftv.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftv.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');  

}else  {
Map<String, dynamic> data = {
       'days': checked,
      'starthour':  timeOfDayToString(selectedTimes[0]),
      'endhour':  timeOfDayToString(selectedTimes[1]),
      
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftv.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftv.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');  
}
if(SelectPrice==1){
  setState(() {
  types.clear();
  customnumber.clear();
  prices.clear();
    
     types.add("per person");
     customnumber.add(1);
     prices.add(double.parse(singlepricecontroller.text));
 //prices.add(singlepricecontroller.text);

  
 });
 Map<String, dynamic> data = {
      'price':  prices,
      'customnumber': customnumber,
      'price_type': types
      
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftv.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftv.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');  

}else{
 setState(() {
  types.clear();
  customnumber.clear();
  prices.clear();
    for(var ins in categories){
    
     types.add(ins.type);
     customnumber.add(ins.customerNumber);
 prices.add(ins.price);

  }
 });
 print(categories);
  
 Map<String, dynamic> data = {
      'types':   types,
      'custmnumber':customnumber,
      'prices':prices

       
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Draftv.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Draftv.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');  
}
   
  }

  Future<void> _loadDraft() async {
    if(Selectedtype==1){
       Map<String, dynamic> data = await  Draftv.loadDraft(widget.draftid, ['starthour', 'endhour']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
          
        selectedTimes[0]= data['starthour'];
       selectedTimes[1]= data['endhour'];
     
    });
    }else if(Selectedtype == 2){
 Map<String, dynamic> data = await  Draftv.loadDraft(widget.draftid, ['starthour', 'endhour','activitydate']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
         startdatecontroller.text = data['activitydate'];
        selectedTimes[0]= data['starthour'];
       selectedTimes[1]= data['endhour'];
     
    });
    }else if(Selectedtype==3){

    }else{

    }
   
  }
  void onpressed() {
  }

  Future<void> _selectTime(BuildContext context, int index) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTimes[index],
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );
  if (picked != null && picked != selectedTimes[index]) {
    setState(() {
      selectedTimes[index] = picked;
    });
  }
}
List<Map<String, dynamic>> generatePriceJsonList(List<String> priceTypes, List<int> numberOfClients, List<double> prices) {
  List<Map<String, dynamic>> priceList = [];
  for (int i = 0; i < priceTypes.length; i++) {
    priceList.add({
      'price_type': priceTypes[i],
      'number_of_clients': numberOfClients[i],
      'price': prices[i],
    });
  }
  return priceList;
}
 
 Future<void> submitWeeklyActivity() async {
  List<Map<String, dynamic>> priceList = generatePriceJsonList(types, customnumber, prices);

  Map<String, dynamic> fullDraftData = await Draftv.loadFullDraft(widget.draftid);

  // Helper functions to convert draft data
  List<String> convertToList(String? data) {
    return data != null ? data.split(',').map((item) => item.trim()).toList() : [];
  }

  List<Map<String, String>> convertToMapList(String? data, String key) {
    return convertToList(data).map((item) => {key: item}).toList();
  }

  // Get the list of images, ensuring exactly 4 images are provided
  List<File?> images = convertToList(fullDraftData['images'])
      .take(4) // Take at most 4 images
      .map((path) => path.isNotEmpty ? File(path) : null)
      .toList();
     
  // Ensure there are exactly 4 images, filling with null if necessary
  while (images.length < 4) {
    images.add(null);
    
  }
  List<String> filePaths = images.map((file) => file?.path ?? '').toList();

  FormData formData = FormData();
  for (File? image in images) {
    if (image != null) {
      formData.files.add(MapEntry(
        "image_path",
        await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
      ));
    }
  }
 int? convertUserIdToInt(String? userId) {
  if (userId == null) {
    print('Error: The user ID is null.');
    // Handle the error as needed
    return null; // or return a default value like 0
  }

  // Attempt to parse the userId as an integer
  final int? userIdInt = int.tryParse(userId);
  
  if (userIdInt == null) {
    print('Error: The user ID is not a valid integer.');
    // Handle the error as needed
    return null; // or return a default value like 0
  }

  return userIdInt;
}

   //print(priceList);
  // Retrieve data from fullDraftData safely
  int category = fullDraftData['category'];
  print(category);
  String type = fullDraftData['type'] ?? '';
  String title = fullDraftData['title'] ?? '';
  String description = fullDraftData['description'] ?? 'vv';
  List<String> highlights = convertToList(fullDraftData['highlights']);
  String destination = fullDraftData['destination'] ?? '';
  List<Map<String,String>> includes = convertToMapList(fullDraftData['notincludes'], 'description');
  List<Map<String, String>> notIncludes = convertToMapList(fullDraftData['notincludes'], 'description');
  List<String> activityStaff = convertToList(fullDraftData['ActivityStaff']);
  List<Map<String, String>> food = convertToMapList(fullDraftData['food'], 'food');
  print(food);
  List<Map<String, String>> transport = convertToMapList(fullDraftData['transport'], 'transport');
  List<Map<String, String>> suitableFor = convertToMapList(fullDraftData['suitablefor'], 'description');
  List<Map<String, String>> notAllowed = convertToMapList(fullDraftData['notalloawed'], 'description');
  List<String> itemsToBring = convertToList(fullDraftData['itemsTobring']);
  String phoneNumber = fullDraftData['phonenumber'] ?? '';
  int maxGroup = fullDraftData['maxGroup'] ?? 0;
  String meetingPoint = fullDraftData['meetingpoint'] ?? 'sss';
  String arrival = fullDraftData['arrival'] ?? '';
  String dropOff = fullDraftData['dropoff'] ?? '';
  int? publisher =  convertUserIdToInt(globalUserId);//fullDraftData['publisher'] ?? 1;
  //List<Map<String, dynamic>> prices = fullDraftData['prices'] ?? [];
  print(publisher);
  String region = fullDraftData['region'] ?? 'cusail';
  String wilaya = fullDraftData['wilaya'] ?? 'adrar';
  String cutofftime = fullDraftData['cutofftime'] ?? 'cutofftime';
 // String date = fullDraftData['activitydate'] ;
  //String enddate = fullDraftData['enddate'];
 print(priceList);
  // Prepare your WeeklyActivity object using the loaded draft data
  if(Selectedtype ==1){
   DailyActivty daily = 
    DailyActivty(
  category: category, 
  type: type.toString(),
  title: title, 
  description: description, 
  highlights: highlights, 
  destination: destination, 
  includes: includes, 
  notIncludes: notIncludes,
  activityStaff: activityStaff,
  food: food, 
  transport: transport, 
  suitableFor: suitableFor,
  notAllowed: notAllowed,
  itemsToBring: itemsToBring,
  phoneNumber: phoneNumber, 
  maxGroup: maxGroup, 
 meetingPoint: meetingPoint,
  arrival: arrival, 
 dropOff: dropOff, 
  publisher: publisher, 
  prices: priceList,
  starthour: timeOfDayToString(selectedTimes[0]), 
  endhour: timeOfDayToString(selectedTimes[1]),
  region: region,
  wilaya: wilaya,           
  cutofftime: cutofftime
  );
  int? activityId = await registerdailyAct(daily);
  //var response = await registerWeeklyActivity(activity);
  
   await uploadPhotos(activityId!, images);
    print('Activity created and photos uploaded successfully');

  }else if(Selectedtype ==2){
    SpecificDurationActivity specific = SpecificDurationActivity(
      category: category, 
  type: type,
  title: title,
  description: description, 
  highlights: highlights, 
  destination: destination, 
  includes: includes, 
  notIncludes: notIncludes,
  activityStaff: activityStaff,
  food: food,
  transport: transport,
  suitableFor: suitableFor, 
  notAllowed: notAllowed, 
  itemsToBring: itemsToBring,
  phoneNumber: phoneNumber, 
  maxGroup: maxGroup,
  meetingPoint: meetingPoint,
  arrival: arrival,
  dropOff: dropOff,
  publisher: publisher, 
  prices: priceList, 
  starthour: timeOfDayToString(selectedTimes[0]),
  endhour: timeOfDayToString(selectedTimes[1]), 
  region: region, 
  wilaya: wilaya,
  cutofftime: cutofftime, 
  startDate: startdatecontroller.text, 
  endDate: enddatecontroller.text
  );
  int? activityId = await registespecificdurationAct(specific);
  //var response = await registerWeeklyActivity(activity);
  
   await uploadPhotos(activityId!, images);
    print('Activity created and photos uploaded successfully');

  }else if(Selectedtype==3){
OneDayActivity oneday = OneDayActivity(
  category: category, 
  type: type, 
  title: title, 
  description: description, 
  highlights: highlights, 
  destination: destination,
 includes: includes, 
 notIncludes: notIncludes,
 activityStaff: activityStaff, 
 food: food, 
 transport: transport,
  suitableFor: suitableFor,
   notAllowed: notAllowed, 
   itemsToBring: itemsToBring,
    phoneNumber: phoneNumber, 
    maxGroup: maxGroup,
     meetingPoint: meetingPoint, 
     arrival: arrival, 
     dropOff: dropOff, 
     publisher: publisher, 
     prices: priceList, 
     starthour: timeOfDayToString(selectedTimes[0]), 
     endhour:timeOfDayToString(selectedTimes[1]) ,
      region: region,
       wilaya: wilaya, 
       cutofftime: cutofftime,
        date: startdatecontroller.text
        );
        int? activityId = await registeronedayAct(oneday);
  //var response = await registerWeeklyActivity(activity);
  
   await uploadPhotos(activityId!, images);
    print('Activity created and photos uploaded successfully');


  } 
  
  
  else{
    WeeklyActivity activity = WeeklyActivity(
    category: category,
    type: type.toString(),
    title: title,
    description: description,
    highlights: highlights,
    destination: destination,
    includes: includes,
    notIncludes: notIncludes,
    activityStaff: activityStaff,
    food: food,
    transport: transport,
    suitableFor: suitableFor,
    notAllowed: notAllowed,
    itemsToBring: itemsToBring,
    phoneNumber: phoneNumber,
    maxGroup: maxGroup,
    meetingPoint: meetingPoint,
    arrival: arrival,
    dropOff: dropOff,
    publisher: publisher,
    prices: priceList,
    region: region,
    wilaya: wilaya,
    cutofftime: cutofftime,
   days:  checked,
    start_hour: timeOfDayToString(selectedTimes[0]),
    end_hour: timeOfDayToString(selectedTimes[1]),
    
  );

  // Submit the activity
 int? activityId = await registerWeeklyActivity(activity);
  //var response = await registerWeeklyActivity(activity);
  
   await uploadPhotos(activityId!, images);
    print('Activity created and photos uploaded successfully');


  }
  


}
 

 
  void nextMethod() {
   _saveDraft();
   submitWeeklyActivity();
  }
  void _addCategory() {
    setState(() {
      categories.add(Category(type: "Type", customerNumber: 1, price: 0));
       for(var instene in categories){
        print(instene.customerNumber);
        print(instene.price);
        print(instene.type);
       }
    });
  }

  void _removeCategory() {
    setState(() {
      if (categories.isNotEmpty) {
        categories.removeLast();
      }
    });
  }

  void _updateCategory(int index, Category category) {
    setState(() {
      categories[index] = category;
    });
  }
}

  Map<String, bool> checkedDays = {
    "Monday": false,
    "Tuesday": false,
    "Wednesday": false,
    "Thursday": false,
    "Friday": false,
    "Saturday": false,
    "Sunday": false,
  };
  List<String> checked = [];
List<String> getCheckedDays() {
    
    checkedDays.forEach((day, isChecked) {
      
      if (isChecked &&!checked.contains(day) ) {
        checked.add(day);
      }
    });
    return checked;
  }
 
 class DaysOfWeekCheckbox extends StatefulWidget {
  @override
  _DaysOfWeekCheckboxState createState() => _DaysOfWeekCheckboxState();
}

class _DaysOfWeekCheckboxState extends State<DaysOfWeekCheckbox> {
  final List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];


  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ...daysOfWeek.map((day) {
            return CheckboxListTile(
              title: Text(day),
              value: checkedDays[day],
              onChanged: (bool? value) {
                setState(() {
                  checkedDays[day] = value!;
                  print(getCheckedDays()); // Print the list of checked days
                });
              },
            );
          }).toList(),
          SizedBox(height: 20),
          Text(
            "Checked Days: ${getCheckedDays().join(", ")}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

 
class CategoryRow extends StatefulWidget {
  final Category category;
  final int index;
  final Function(int, Category) onCategoryChanged;

  CategoryRow({
    required this.category,
    required this.index,
    required this.onCategoryChanged,
  });

  @override
  _CategoryRowState createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  final List<String> categoryTypes = [
    "adult",
    "child",
    "coulage group",
    "family",
    "group of children",
    "disabled people",
    "elderly"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 530,
      height: 70,
      child: Row(
        children: [
          SizedBox(width: 12),
          Container(
            width: 141,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButton<String>(
              value: categoryTypes.contains(widget.category.type) ? widget.category.type : null,
              hint: Text("Type"),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    widget.category.type = newValue;
                  });
                  widget.onCategoryChanged(widget.index, widget.category);
                }
              },
              items: categoryTypes.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 110,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Number of Customers',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
              onChanged: (value) {
                setState(() {
                  widget.category.customerNumber = int.tryParse(value) ?? 0;
                });
                widget.onCategoryChanged(widget.index, widget.category);
              },
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 101,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
              onChanged: (value) {
                setState(() {
                  widget.category.price = double.tryParse(value) ?? 0;
                });
                widget.onCategoryChanged(widget.index, widget.category);
              },
            ),
          ),
        ],
      ),
    );
  }
  

}

class Price {
  final String priceType;
  final int numberOfClients;
  final double price;

  Price({required this.priceType, required this.numberOfClients, required this.price});

  Map<String, dynamic> toJson() => {
        'price_type': priceType,
        'number_of_clients': numberOfClients,
        'price': price,
      };
      factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      priceType: json['price_type'],
      numberOfClients: json['number_of_clients'],
      price: json['price'],
    );
  }

}
 