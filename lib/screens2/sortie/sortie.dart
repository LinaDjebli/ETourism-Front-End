import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Booking {
  final String firstname;
  final String lastname;
  final String email;
  final int age;
  final String wilaya;
  final String phonenumber;
  final int numberOfTickets;
  final double totalPrice;

  Booking({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.age,
    required this.wilaya,
    required this.phonenumber,
    required this.numberOfTickets,
    required this.totalPrice,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      age: json['age'],
      wilaya: json['wilaya'],
      phonenumber: json['phonenumber'],
      numberOfTickets: json['number_of_tickets'],
      totalPrice: json['total_price'],
    );
  }
}

Future<List<Booking>> fetchBookings(int publisherId) async {
  final response = await http.get(Uri.parse('http://YOUR_DJANGO_BACKEND_URL/api/bookings/publisher/$publisherId/'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((booking) => Booking.fromJson(booking)).toList();
  } else {
    throw Exception('Failed to load bookings');
  }
}

class SortiePage1 extends StatefulWidget {
  @override
  _SortiePage1State createState() => _SortiePage1State();
}

class _SortiePage1State extends State<SortiePage1> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
   Container(
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 2.5,
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
             ],
            ),
           //category

 
  Positioned(
  top: MediaQuery.of(context).size.height * 0.1 - 40,
  right: 0,
  left: 0,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
    children: [
Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Positioned(
    right: MediaQuery.of(context).size.width * 0.2 - 45,
    left: MediaQuery.of(context).size.width * 0.17 - 45,
    top: MediaQuery.of(context).size.height * 0.1 - 40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
      children: [
        Text(
          'Vertical Bar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Statistics of the month',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18, // Adjusted the font size
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10), // Adjust the spacing as needed
        Row(
          children: [
            Flexible(
              child: Container(
                height: 55,
                width: 700,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Choose a destination',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(102, 0, 0, 0),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 30, 30, 30).withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15), // Adjust the width as needed for the desired space
            SizedBox(
              height: 51,
              width: 51,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: Color.fromRGBO(245, 246, 249, 1),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.notifications,
                  color: const Color.fromARGB(128, 0, 0, 0), // Adjust the color of the icon as needed
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children with space between them
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 88,
                    width: 88,
                    child: Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 1)),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 30, 30, 30).withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10), // Adjust the vertical space as needed
                  Text(
                    'Text 2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Adjust the horizontal space between containers
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 88,
                    width: 88,
                    child: Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 1)),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 30, 30, 30).withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10), // Adjust the vertical space as needed
                  Text(
                    'Text 2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Adjust the horizontal space between containers
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 88,
                    width: 88,
                    child: Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 1)),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 30, 30, 30).withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10), // Adjust the vertical space as needed
                  Text(
                    'Text 3',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30), 
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              '296 activities found ',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 12,
              ),
            ),
            SizedBox(width: 2),
            Icon(
              Icons.find_replace_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 15,
            ),
            Spacer(),
            GestureDetector(
              onTap: () => _showSortOptions(context),
              child: Row(
                children: [
                  Text(
                    'Sort by',
                    style: TextStyle(
                      color: Color.fromARGB(255, 56, 129, 177),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.swap_vert,
                    color: Color.fromARGB(255, 56, 129, 177),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
      ],
    ),
  ),
),
SizedBox(height: 20), // Adjust the space between the Positioned widgets
 Positioned(
  top: MediaQuery.of(context).size.height * 0.5 - 40,
  left: 0,
  right: 0,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(174, 128, 167, 221),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
           Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/caption.jpg',
                  width: 140,
                  height: 140,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'ACTIVITY/PLACE NAME',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Constantine : Discover \n old and European towns',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '7 - 20 days',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      'FROM 20 DA per person',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 62, 62),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(174, 128, 167, 221),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/caption.jpg',
                  width: 140,
                  height: 140,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'ACTIVITY/PLACE NAME',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Constantine : Discover \n old and European towns',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '7 - 20 days',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      'FROM 20 DA per person',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 62, 62),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),
 ],
  ),
),
 ]
  ))
    ,
    
       
       );
   
  }


   void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be larger
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8, // Set height to 80% of screen height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48), // To balance the row since the IconButton takes some space
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text('Alphabetical'),
                onTap: () {
                  // Add your sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rating'),
                onTap: () {
                  // Add your sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date'),
                onTap: () {
                  // Add your sorting logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showRegionOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be larger
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8, // Set height to 80% of screen height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Region',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48), // To balance the row since the IconButton takes some space
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 1'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 2'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 3'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
                            ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 4'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

 



}




