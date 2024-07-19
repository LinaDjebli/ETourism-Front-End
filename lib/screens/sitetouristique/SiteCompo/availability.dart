
import 'package:flutter/material.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/PageCompt/reservepage.dart';


class availability extends StatefulWidget {
  @override
  _availability createState() => _availability();
}

class _availability extends State<availability> {
   int adultCount = 1;
  int childrenCount = 0;
  int infantCount = 0;


  int adultPrice = 20;
  int childrenPrice = 10;
  int infantPrice = 5;


  int calculateTotalPrice() {
    return (adultCount * adultPrice) + (childrenCount * childrenPrice) + (infantCount * infantPrice);
  }
  String _truncateText(String text, int wordLimit) {
  List<String> words = text.split(' ');
  if (words.length <= wordLimit) {
    return text;
  } else {
    return words.sublist(0, wordLimit).join(' ') + '...';
  }
}


 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Availability'),
    ),
    body: Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
              Positioned(
  bottom: 0,
  right: 0,
  left: MediaQuery.of(context).size.width * 0.17 - 45,
  top: MediaQuery.of(context).size.height * 0.09 - 40,
  child:
   Container(
    width: 550,
   
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     // cote lfo9
            Text(
    'Activity details',
    style:TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
  ),
 SizedBox(height: 5),
                  Positioned( 
                  bottom: 0,
                  right: 0,
                   left: MediaQuery.of(context).size.width * 0.12 - 45,
  top: MediaQuery.of(context).size.height * 0.18 - 40,
                  child :
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 300,
                                            width: 500,
                                            child: Center(
                                              child: Text("Dialog Content for First Icon"), // Replace with your dialog content
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 81,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 53, 52, 53),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  SizedBox(width: 10),
                                                  Icon(
                                                    Icons.date_range,
                                                    color: Color.fromARGB(255, 0, 0, 0),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    'Date',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Spacer(), // Adds space between the first and second groups
                                                  Text(
                                                    'Jun 1, 2023',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color.fromARGB(255, 50, 99, 163),
                                                  ),
                                                  SizedBox(width: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder: (BuildContext context, StateSetter setState) {
                                            return Container(
                                              height: MediaQuery.of(context).size.height * 0.6,
                                              padding: EdgeInsets.all(20),
                                              color: Color.fromARGB(255, 212, 222, 231),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                      SizedBox(width: 80),
                                                      Text(
                                                        'Participants',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  Divider(color: Color.fromARGB(148, 129, 127, 127)),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Adult \n (Age 18-99)',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                       Spacer(),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            adultCount = adultCount > 0 ? adultCount - 1 : adultCount;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.remove_circle,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        '$adultCount',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            adultCount++;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.add_circle,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Children \n (Age 4-17)',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                       Spacer(),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            childrenCount = childrenCount > 0 ? childrenCount - 1 : childrenCount;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.remove_circle,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        '$childrenCount',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            childrenCount++;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.add_circle,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Infant \n (Age 3 and younger)',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                     Spacer(),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            infantCount = infantCount > 0 ? infantCount - 1 : infantCount;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.remove_circle,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        '$infantCount',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            infantCount++;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.add_circle,
                                                          size: 35,
                                                          color: Color.fromARGB(255, 43, 112, 190),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ).then((_) {
                                      setState(() {
                                        // Update the total price when the bottom sheet is closed
                                        calculateTotalPrice();
                                      });
                                    });
                                  },
                                  child: Container(
                                    height: 81,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 53, 52, 53),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  SizedBox(width: 10),
                                                  Icon(
                                                    Icons.person,
                                                    color: Color.fromARGB(255, 0, 0, 0),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    'Participants',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Spacer(), // Adds space between the first and second groups
Text(
  _truncateText('$adultCount Adult, $childrenCount Children, $infantCount Infant', 3),
  style: TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16,
  ),
  overflow: TextOverflow.ellipsis,
),


 SizedBox(width: 5),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color.fromARGB(255, 50, 99, 163),
                                                  ),
                                                  SizedBox(width: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )  ,
             SizedBox(height: 10),
           
           //cote ltaht
              Text(
    'Options',
    style:TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
  ),
  SizedBox(height: 5),
Positioned(
  bottom: 0,
  right: 0,
  left: MediaQuery.of(context).size.width * 0.12 - 45,
  top: MediaQuery.of(context).size.height * 0.13 - 40,
  child: GestureDetector(
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Container(
            height: 630,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                color: Color.fromARGB(255, 53, 52, 53),
                width: 2.0,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Activity name',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'So this is where I should write the\n description of the activity',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.person_2_outlined,
                            color: Color.fromARGB(255, 43, 112, 190),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Guide: Arabic',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.timelapse_outlined,
                            color: Color.fromARGB(255, 41, 106, 197),
                          ),
                          SizedBox(width: 12),
                          Text(
                            '10 hours',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 54, 119, 198),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Mn map tnjab',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 76, 255),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Color.fromARGB(255, 129, 127, 127),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Starting time',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '8:00 AM',
                            style: TextStyle(
                              color: Color.fromARGB(255, 166, 164, 164),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 290,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(218, 193, 192, 192),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Total price',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              color: Colors.blueGrey,
                              height: 50,
                              child: Center(
                                child: Text(
                                  '${calculateTotalPrice()}\da',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'All taxes and fees included',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ReservePage(
                                            activityName: 'Activity name', // replace with dynamic value
                                            startingTime: '8:00 AM', // replace with dynamic value
                                            totalPrice: calculateTotalPrice(), // replace with dynamic value
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 60,
                                      margin: const EdgeInsets.only(right: 8),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const ShapeDecoration(
                                        color: Color.fromARGB(255, 22, 89, 152),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                              padding: const EdgeInsets.all(0),
                                              child: Center(
                                                child: Text(
                                                  'Reserve now & pay later',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
)
 ]
              )
              )
              ),


  ]))   ]))]
  ));
          
              }



 
 
 
}
