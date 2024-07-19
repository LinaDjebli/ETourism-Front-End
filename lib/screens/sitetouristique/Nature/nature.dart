import 'package:flutter/material.dart';
import 'package:tro/screens/sitetouristique/Culture/culture.dart';
import 'package:tro/screens/sitetouristique/Hotel/hotel.dart';
import 'package:tro/screens/sitetouristique/Resto/food.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/PageCompt/region.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/PageCompt/searchforu.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/detail.dart';
import 'package:tro/screens/sitetouristique/for_you/home.dart';



 class NaturePage1 extends StatelessWidget {
 Widget buildCategory0(String categoryName, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
      width: 80,
      height: 39.25,
      margin: const EdgeInsets.only(right: 8),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color:Color.fromARGB(0, 0, 12, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(0, 0, 0, 0),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromARGB(0, 0, 0, 0),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 20,
                bottom: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    categoryName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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
    ),
 // bottomNavigationBar: CustomBottomNavigationBar(),
    );
   
  }
  
 Widget buildCategory1(String text, ) {
    return Container(
      width: 80,
      height: 39.25,
      margin: const EdgeInsets.only(right: 8),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(0, 0, 0, 0),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromARGB(0, 0, 0, 0),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 20,
                bottom: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 11,
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
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/caption.jpg',
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
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
            Positioned(
              right: 0,
              left: MediaQuery.of(context).size.width * 0.15 - 45,
              top: MediaQuery.of(context).size.height * 0.6 - 40,
              child: Container(
                width: 550,
                height: 42.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: 
                  
                  Row(
                    children: [
                      buildCategory0('For you', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => foru()));
                      }),
                     buildCategory0('Culture', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CulturePage1()));
                      }),


                      buildCategory1('Nature'),
                      buildCategory0('Hotel', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HotelPage1()));
                      }),
                      buildCategory0('Food', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage1()));
                      }),
                    ],
                  ),
                ),
              ),
            ),
 Positioned(
  bottom: 0,
  right: 0,
  left: MediaQuery.of(context).size.width * 0.17 - 45,
  top: MediaQuery.of(context).size.height * 0.22 - 40,
  child: Container(
    width: 550,
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Let\'s plan your next \n vacation in Algeria',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 30), 
        Text(
          'Immerse yourself in some of the world’s\n most historic Bardo National Museum on',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 30), 
        Row(
          children: [
            Text(
              'Learn more ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 8), // Add space between text and icon
            Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 18,
            ),
          ],
        ),
          ]),
  ),
),
 //
 Positioned(
  bottom: 0,
  right: 0,
  left: MediaQuery.of(context).size.width * 0.17 - 45,
  top: MediaQuery.of(context).size.height * 0.69 - 40,
  child: Container(
    width: 550,
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'Make your best \n experiences',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 20), 
      Container(
       // height: 600,
        width: 500,
        child: 
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
                       GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage1()),
    );
  },
  child: 
  Container(
    height: 460,
    width: 300, 
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Color.fromARGB(129, 114, 114, 114), 
        width: 2.0, 
      ),
    ),
    child: Column(
      children: [
        Container(
          height: 240,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image(
              fit: BoxFit.cover, 
              image: AssetImage('assets/caption.jpg'),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WATER ACTIVITY',
                style: TextStyle(
                  color: Color.fromARGB(255, 123, 125, 123),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Bordj El Behri : Architecture\nHour Guided',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Text(
                    '4.9   (2336)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'From \$12.00 per person',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
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
)
,
                        SizedBox(width: 30,),
                       GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage1()),
    );
  },
  child: 
  Container(
    height: 460,
    width: 300, 
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Color.fromARGB(129, 114, 114, 114), 
        width: 2.0, 
      ),
    ),
    child: Column(
      children: [
        Container(
          height: 240,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image(
              fit: BoxFit.cover, 
              image: AssetImage('assets/caption.jpg'),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WATER ACTIVITY',
                style: TextStyle(
                  color: Color.fromARGB(255, 123, 125, 123),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Bordj El Behri : Architecture\nHour Guided',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 5),
                  Text(
                    '4.9   (2336)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'From \$12.00 per person',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
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
)
,
                         SizedBox(width: 30,),
           ]
            )
            )
            )
            , SizedBox(height: 30), 
 Text(
              'Zoning In Algeria',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
 SizedBox(height: 20), 
Container(
  width: 400,
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        // First image container with two individual text containers
Stack(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => regionPage()),
        );
      },
      child: Container(
        height: 160,
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/caption.jpg'),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 120,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 120,
          height: 30,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 0, 4, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'Text Inside Image 1',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 93,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 90,
          height: 25,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'nbr d\'activitie',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
)
  , SizedBox(width: 20),
        // Second image container with two individual text containers
Stack(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => regionPage()),
        );
      },
      child: Container(
        height: 160,
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/caption.jpg'),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 120,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 120,
          height: 30,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 0, 4, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'Text Inside Image 1',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 93,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 90,
          height: 25,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'nbr d\'activitie',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
)
 , SizedBox(width: 20),
        // Repeat for the remaining image containers
      ],
    ),
  ),
),
 SizedBox(height: 20), 
Container(
  width: 400,
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        // First image container with two individual text containers
Stack(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => regionPage()),
        );
      },
      child: Container(
        height: 160,
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/caption.jpg'),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 120,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 120,
          height: 30,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 0, 4, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'Text Inside Image 1',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 93,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 90,
          height: 25,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'nbr d\'activitie',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
)
 , SizedBox(width: 20),
        // Second image container with two individual text containers
 Stack(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => regionPage()),
        );
      },
      child: Container(
        height: 160,
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/caption.jpg'),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 120,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 120,
          height: 30,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 0, 4, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'Text Inside Image 1',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 93,
      left: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regionPage()),
          );
        },
        child: Container(
          width: 90,
          height: 25,
          margin: const EdgeInsets.only(right: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'nbr d\'activitie',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
)
 , SizedBox(width: 20),
        // Repeat for the remaining image containers
      ],
    ),
  ),
),
  SizedBox(height: 30), 
 Text(
              'Best Willaya With \n These Activity',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
   SizedBox(height: 30), 
Container(
  //height: 300,
  width: 350,
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        // First image container
 Stack(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WillayaPage()),
        );
      },
      child: Container(
        height: 300,
        width: 220,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/caption.jpg'),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 23,
      left: 23,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WillayaPage()),
          );
        },
        child: Text(
          'Alger',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  ],
)
 ,SizedBox(width: 20),
        // Repeat for the rest of the image containers
 Stack(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WillayaPage()),
        );
      },
      child: Container(
        height: 300,
        width: 220,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/caption.jpg'),
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 23,
      left: 23,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WillayaPage()),
          );
        },
        child: Text(
          'Alger',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  ],
)
 ,SizedBox(width: 20),
        // Repeat for the remaining image containers
      ],
    ),
  ),
),
],
        ),
          ),
  ),


 //search
Positioned(
  right: MediaQuery.of(context).size.width * 0.2- 45,
  left: MediaQuery.of(context).size.width * 0.17 - 45,
  top: MediaQuery.of(context).size.height * 0.1 - 40,
  child: Row(
    children: [
      // Search bar on the left
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
      // Spacer for space between search bar and icon
      SizedBox(width: 15), // Adjust the width as needed for the desired space
      // Box on the right
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
            backgroundColor:  Color.fromRGBO(245, 246, 249, 1),
          ),
          onPressed: () {},
          child: Icon(
            Icons.notifications, // Replace this with the icon you want to use
            color: const Color.fromARGB(128, 0, 0, 0), // Adjust the color of the icon as needed
          ),
        ),
      ),
    ],
  ),
),
   ],
        ),
      ),
    );
  }


}





