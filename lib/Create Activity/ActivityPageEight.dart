import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:tro/Componants/My_Timeline.dart';
import 'package:tro/Componants/SelectButton.dart';
import 'package:tro/Componants/SelectChip.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/Text&Field.dart';
import 'package:tro/Create%20Activity/ActivityPagenine.dart';
import 'package:tro/Create%20Activity/Draft.dart'as Drafte;
import 'package:tro/constants/Size.dart';

class ActivityPageEight extends StatefulWidget {
  String draftid;
  ActivityPageEight({super.key, required this.draftid});

  @override
  State<ActivityPageEight> createState() => _ActivityPageEightState();
}

class _ActivityPageEightState extends State<ActivityPageEight> {
  List<String> SelectedItems = [];
 
  final List<int> finalchoice = [];
  List<String> maxsize = [];

   int SelectedDropOff = 0;
    bool _isLanguageSelected = true ;
    TextEditingController _controller = TextEditingController();
      TextEditingController UrlCotroller = TextEditingController();
double _counterValue =  0.5;
  void _openMultiSelect() async {
    final List<String> items = ["English", "French", "Italian", "Arabic"];
    
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(
          items: items,
          Text: "choose your language ",
        );
      },
    );

    if (results != null) {
    setState(() {
      SelectedItems = results;
      _isLanguageSelected = true;
      finalchoice.clear(); // Clear the list to avoid duplicate entries
       for( int i = 0 ; i < SelectedItems.length ; i++){
        finalchoice.add(i+1);
       }
    });
  }else{
    setState(() {
       _isLanguageSelected =  false;
    });
      
  }
}
static const List<int> optionsmaxgroupe = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,38,40,41,42,43,44,45,46,47,48,49,50
  ];
  int  maxgroup = optionsmaxgroupe.first;
static const List<String> optionsarraivel = [
    "5 minutes before " , "10 minutes before ","15 minutes before" , "30 minutes before ", "40 minutes before", "1 hour beofre "
  ];
String  arraivel = optionsarraivel.first;

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
                          "",
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
                Text: "Maximum groupe size  ",
                TextSize: 19,
              ),
              gapH18,
    Container(
            width: 110,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButton<int>(
              value:  maxgroup,
              hint: Text(""),
              onChanged: (int? newValue) {
                setState(() {
                  maxgroup = newValue!;
                });
              },
              items: optionsmaxgroupe.map<DropdownMenuItem<int>>((int item) {
                return DropdownMenuItem<int>(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList(),
            ),
          ),
 gapH16,
 
     

    
 
 TextandField(tooltipText:  '', Text: "Meeting point ", TextSize: 16),
 gapH16,
 
 SizebaleTextfield(controller:  _controller, sizefield:  1, max:  30, hintText:  "Location url ", iconVisible:  false, iconOnPressed: ()=>{}, errortext:  "", eroorcond:  true, onChanged:(S)=>{}),
gapH18,
TextandField(tooltipText:  '', Text: "when they need to arrive ? ", TextSize: 16),

gapH18,
  Container(
            width: 200,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButton<String>(
              value: arraivel,
              hint: Text(""),
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
            ),
          ),

 gapH18,
  
            TextandField(
                tooltipText:
                    "Define if trnasportation is included in this activity ",
                Text: "Drop Off ",
                TextSize: 17),
            Column(children: <Widget>[
              RadioListTile(
                title: Text('Same place where they where picked  '),
                value: 1,
                groupValue: SelectedDropOff,
                onChanged: (value) {
                  setState(() {
                    SelectedDropOff = value as int;
                  });
                }
              ),
              if(SelectedDropOff == 1)...{
                
              },
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title: Text('on a diffrenent place '),
                value: 2,
                groupValue: SelectedDropOff,
                onChanged: (value) {
                  setState(() {
                    SelectedDropOff = value as int;
                  });
                },
              ),
              if(SelectedDropOff ==2)...{
                 TextandField(
                      
                        tooltipText:
                            "specify the place where you drop them off ",
                        Text: "add the addresse  ",
                        TextSize: 17),
                   SizebaleTextfield(
                        controller: UrlCotroller,
                        sizefield: 1,
                        max: 10,
                        hintText: "Url",
                        iconVisible: false,
                        iconOnPressed: onpressed, errortext: '', eroorcond:  true, onChanged: (String ) {  },)
              },
              SizedBox(width: 350, child: Divider()),
              RadioListTile(
                title: Text('Drop off service not provided  '),
                value: 3,
                groupValue: SelectedDropOff,
                onChanged: (value) {
                  setState(() {
                    SelectedDropOff = value as int;
                  });
                },
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
            ]),
   ]) )));
  }
  String dropoff = "";
Future<void> _saveDraft() async {
  if(SelectedDropOff==1){
    dropoff="same place as meeting point ";
  }else if(SelectedDropOff == 2){
    dropoff = UrlCotroller.text;
  }else {
    dropoff = "Drop off service is not provided";
  }


    Map<String, dynamic> data = {
      'maxgroup':  maxgroup,
      'meetingpoint':   _controller.text,
      'arraivel':  arraivel,
      'dropoff':dropoff,
    };
    print('Saving draft: $data'); // Print statement to check saved data
    await Drafte.saveDraft(widget.draftid, data);
    Map<String, dynamic> fullDraftData = await  Drafte.loadFullDraft(widget.draftid);
    print('Full draft data: $fullDraftData');
  }

  Future<void> _loadDraft() async {
    Map<String, dynamic> data = await  Drafte.loadDraft(widget.draftid, ['maxgroup', 'meetingpoint', 'arraivel','dropoff']);
    print('Loaded draft: $data'); // Print statement to check loaded data
    setState(() {
        maxgroup= data['maxgroup'].split(',');
       _controller = data['meetingpoint'].split(',');
      arraivel = data['arraivel'].split(',');
      dropoff=  data['dropoff'];
    });
  }
  void onpressed() {
  }

  void nextMethod() {
    _saveDraft();
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  ActivityPagenine(
          draftid: widget.draftid,
        ),
      ),
    );
  }
}
 


 
class Countbtn extends StatefulWidget {
  final bool loading;
  final ValueChanged<double> onChange;
  final double count;
  final Color countColor;
  final Color buttonColor;
  final Color progressColor;
  final Icon removeIcon;
  final Icon addIcon;

   Countbtn({
    Key? key,
    required this.loading,
    required this.onChange,
    required this.count,
    required this.countColor,
    required this.buttonColor,
    required this.progressColor,
    required this.removeIcon,
    required this.addIcon,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountbtnState createState() => _CountbtnState();
}

class _CountbtnState extends State<Countbtn> {
  double _count = 0 ;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  void _increment() {
    if (_count < 60) {
      setState(() {
        _count += 0.5;
        widget.onChange(_count);
      });
    }
  }

  void _decrement() {
    if (_count > 0.5) {
      setState(() {
        _count -= 0.5;
        widget.onChange(_count);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
       border: Border.all(color: Color.fromARGB(255, 221, 219, 219)),
              borderRadius: BorderRadius.circular(10),
          color: Colors.white
        
      ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          IconButton(
            icon: widget.removeIcon,
            color: widget.buttonColor,
            onPressed: widget.loading ? null : _decrement,
          ),
          Text(
            _count.toString(),
            style: TextStyle(color: widget.countColor),
          ),
          IconButton(
            icon: widget.addIcon,
            color: widget.buttonColor,
            onPressed: widget.loading ? null : _increment,
          ),
        ],
      ),
    );
  }
}
