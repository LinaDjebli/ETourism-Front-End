

import 'package:flutter/material.dart';
import 'package:tro/screens/Componants/ExpandedListAnimationWidget.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State with TickerProviderStateMixin {
  late bool isStretchedDropDown1;
  late bool isStretchedDropDown2;
  late bool isStretchedDropDown3;
  int groupValue1 = -1;
  int groupValue2 = -1;
  int groupValue3 = -1;
  String title1 = 'Choose your style';
  String title2 = 'Choose your length';
  String title3 = 'Choose your Price';
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;

  @override
  void initState() {  
    super.initState();
    isStretchedDropDown1 = false;
    isStretchedDropDown2 = false;
    isStretchedDropDown3 = false;
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
  }

   Widget buildCategory2(String text) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      //fontWeight: FontWeight.w700,
                      height: 0.20,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
    
    Widget buildCategory6(String text) {
  return Container(
    width: 180,
    height: 30000,
    margin: const EdgeInsets.only(right: 8),
    clipBehavior: Clip.antiAlias,
    decoration: const ShapeDecoration(
      color: Color.fromARGB(255, 58, 91, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        ),
      ),
      
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 30000,
            padding: const EdgeInsets.only(
              top: 20,
              left: 74,
              right: 5,
              bottom: 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start, 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
      preferredSize: const Size.fromHeight(100), 
      child: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Cantinue planning ",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 46, 42, 42),
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    ),

      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SafeArea(
            child: Column(
              children: [
                        
           Container(
                width: 550,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategory2('Desired Trip Style'),
                    ],
                  ),
                ),
              ),
            
 
              const SizedBox(height: 1),
                buildDropDown(title1, _scrollController1, _list),
                       Container(
                width: 550,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategory2('Desired Trip Langth'),
                    ],
                  ),
                ),
              ), 
              const SizedBox(height: 1),
                buildDropDown(title2, _scrollController2, _list2),
                Container(
                width: 550,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategory2('Desired Trip Price'),
                    ],
                  ),
                ),
              ), 
              const SizedBox(height: 1),
                buildDropDown(title3, _scrollController3, _list3),
              
                Positioned(
  right: 0,
    left: MediaQuery.of(context).size.width * 0.36 - 45,
              top: MediaQuery.of(context).size.height * 1.12- 40,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DropDown(
        ) ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
      child: Container(
       width: 550,
                height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
                width: 550,
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategory6('Next'),
                    ],
                  ),
                ),
              ),
    ),
  ),
)
)
),  
    

 ],
              
            ),
          ),
        ),
      ),
    );
  }








Widget buildDropDown(String dropdownTitle, ScrollController scrollController, List<String> dropdownList) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: dropdownTitle == title1 ? isStretchedDropDown1 ? null : 70 : 
              dropdownTitle == title2 ? isStretchedDropDown2 ? null : 70 :
              dropdownTitle == title3 ? isStretchedDropDown3 ? null : 70: 70,
      decoration: BoxDecoration(
       border: Border.all(
  color: dropdownTitle == title1 ? isStretchedDropDown1 ? Color.fromARGB(255, 255, 255, 255) : Colors.transparent :
         dropdownTitle == title2 ? isStretchedDropDown2 ? Color.fromARGB(255, 255, 255, 255) : Colors.transparent :
         dropdownTitle == title3 ? isStretchedDropDown3 ? Color.fromARGB(255, 232, 232, 232) : Colors.transparent :
         Colors.transparent,
      width: 2
),

        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (dropdownTitle == title1) {
                  isStretchedDropDown1 = !isStretchedDropDown1;
                  isStretchedDropDown2 = false;
                  isStretchedDropDown3 = false;
                } else if (dropdownTitle == title2) {
                  isStretchedDropDown2 = !isStretchedDropDown2;
                  isStretchedDropDown1 = false;
                  isStretchedDropDown3 = false;
                } else if (dropdownTitle == title3) {
                  isStretchedDropDown3 = !isStretchedDropDown3;
                  isStretchedDropDown1 = false;
                  isStretchedDropDown2 = false;
                }
              });
            },
            child: Container(
              
              width: double.infinity,
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              constraints: BoxConstraints(
                minHeight: 65,
                minWidth: double.infinity,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        dropdownTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    dropdownTitle == title1 ? (isStretchedDropDown1 ? Icons.arrow_upward : Icons.arrow_downward) : 
                    dropdownTitle == title2 ? (isStretchedDropDown2 ? Icons.arrow_upward : Icons.arrow_downward) :
                    dropdownTitle == title3 ? (isStretchedDropDown3 ? Icons.arrow_upward : Icons.arrow_downward) : 
                    Icons.arrow_downward
                    , color: Colors.white, 
  size: 24,
                  ),
                ],
              ),
            ),
          ),
         ExpandedSection(
            expand: dropdownTitle == title1 ? isStretchedDropDown1 : 
                    dropdownTitle == title2 ? isStretchedDropDown2 :
                    dropdownTitle == title3 ? isStretchedDropDown3 :
                    false,
            bottom: 0,
            height: 50,
            child: 
        ListView.builder(
  itemCount: dropdownList.length,
  padding: EdgeInsets.all(0),
  controller: scrollController,
  shrinkWrap: true,
  itemBuilder: (context, index) {
    return RadioListTile(
      title: Text(
        dropdownList.elementAt(index),
        style: TextStyle(
          color: Colors.white,
          //fontWeight: FontWeight.bold,
        ),
      ),
      value: index,
      groupValue: dropdownTitle == title1
          ? groupValue1
          : dropdownTitle == title2
              ? groupValue2
              : dropdownTitle == title3
                  ? groupValue3
                  : -1,
      onChanged: dropdownTitle == title1
          ? (int? val) {
              setState(() {
                groupValue1 = val!;
                title1 = dropdownList.elementAt(index);
              });
            }
          : dropdownTitle == title2
              ? (int? val) {
                  setState(() {
                    groupValue2 = val!;
                    title2 = dropdownList.elementAt(index);
                  });
                }
              : dropdownTitle == title3
                  ? (int? val) {
                      setState(() {
                        groupValue3 = val!;
                        title3 = dropdownList.elementAt(index);
                      });
                    }
                  : null,
    );
  },
),
 ),
        ],
      ),
    );
  }
}

List<String> _list = [
  'Dynamic (Frequent Change Of Accommodation)',
  "Relaxed (Move Less, Stay Longer In One Place)",
];
List<String> _list2 = ['Short (3-5 Days)', "Midsize (6-15 Days)", "Long (18-30 Days)",];
List<String> _list3 = ['Expensive (Elegant areas, Upscale people)', "Middle (Beautiful places, memorial areas)", "Cheap (Beautiful Cheap places)",];
