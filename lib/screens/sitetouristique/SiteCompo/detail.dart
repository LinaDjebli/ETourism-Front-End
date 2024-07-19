import 'package:flutter/material.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/availability.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/infoagency/infoagency.dart';



class DetailPage1 extends StatelessWidget {

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Name of the act or place'),
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
                  color: Color.fromARGB(255, 2, 2, 2),
                  child: Stack(
                    children: [
                      ClipRRect(
                     
                        child: Image.asset(
                          'assets/caption.jpg',
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 4,
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
  top: MediaQuery.of(context).size.height * 0.47 - 40,
  child: Container(
    width: 550,
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Alger: 360 vacation in Algeria you \n can see a lot of things in alger cen',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 30), 
 Row(
  children: [
        GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoagencyPage ()), // Replace with your target page
        );
      },
      child:
    Text(
      'Activity provider : ',
      style: TextStyle(
        color: Color.fromARGB(255, 74, 73, 73),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        height: 0.10,
        letterSpacing: 0.10,
      ),
    ),
         ), SizedBox(width: 8), // Add space between text and icon
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoagencyPage ()), // Replace with your target page
        );
      },
      child: Text(
        '369 Alger Centre ',
        style: TextStyle(
          color: Color.fromARGB(255, 23, 85, 255),
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
          height: 0.10,
          letterSpacing: 0.10,
        ),
      ),
    ),
  ],
),
 SizedBox(height: 30), 
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
                                          '4.9 ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                         SizedBox(height: 30), // Add space between text and icon
            Text(
              '3113 reviews',
              style:TextStyle(
                      color: Color.fromARGB(255, 23, 85, 255),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                      letterSpacing: 0.10,
                    ),
            ),
                     SizedBox(height: 20),
        Text(
          'Welcome to our club, where passions ignite and friendships thrive!\n Whether you\'re a seasoned enthusiast or a curious newcomer, our vibrant community offers something for everyone. Dive into a world of shared interests, lively discussions, and unforgettable experiences. Join us on a journey of exploration and connection, where every moment is an opportunity to create memories that last a lifetime. Come, be a part of our club and let\'s embark on exciting adventures together!',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 10,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
          ),
        ), 
                SizedBox(height: 20),
        Text(
          'About this activity',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
       
 SizedBox(height: 20),
       Row(
  children: [
    Icon(
      Icons.access_time_rounded, // Replace with your desired icon
      color: Color.fromARGB(255, 74, 73, 73),
    ),
    SizedBox(width: 8), // Add space between the icon and the text
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Opening times : ',
          style: TextStyle(
            color: Color.fromARGB(255, 74, 73, 73),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.10,
          ),
        ),
        SizedBox(height: 5,)
        ,Text(
          '7 AM TO 19 PM',
          style: TextStyle(
            color: Color.fromARGB(255, 23, 85, 255),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.10,
          ),
        ),
      ],
    ),
  ],
),

 SizedBox(height: 20),
       Row(
  children: [
    Icon(
      Icons.person_sharp, // Replace with your desired icon
      color: Color.fromARGB(255, 74, 73, 73),
    ),
    SizedBox(width: 8), // Add space between the icon and the text
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Live tour guide',
          style: TextStyle(
            color: Color.fromARGB(255, 74, 73, 73),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.10,
          ),
        ),
        SizedBox(height: 5,)
        ,Text(
          'Explore the beauty and history of our region with our \nexpert guide. Offering personalized and engaging tours,\n you\'ll uncover hidden gems and\n fascinating stories\n that make each destination unique.\n Join us for an unforgettable journey  filled with rich\n cultural experiences and breathtaking sights.',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.10,
          ),
        ),
      ],
    ),
  ],
)
 
                   ,   SizedBox(height: 20),
        Text(
          'Experience',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        
  SizedBox(height: 30),
Row(
  children: [
    Text(
      'Highlights ',
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
)
 ,  SizedBox(height: 15),
      Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12), // Line color
      ),
 SizedBox(height: 15),
Row(
  children: [
    Text(
      'Full description',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
),
  SizedBox(height: 15),
        Container(
        height: 2,
        width: double.infinity,
        color:  Color.fromARGB(255, 14, 12, 12), // Line color
      ),
     SizedBox(height: 15),
Row(
  children: [
    Text(
      'Icludes ',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
),
     SizedBox(height: 15),
        Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12), // Line color
      ),
     SizedBox(height: 15),
Row(
  children: [
    Text(
      'Meeting point ',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
),
        SizedBox(height: 15),
        Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12), // Line color
      ),
     SizedBox(height: 15),   
    
    
       Text(
          'Prepare for the activity',
          style: TextStyle(
            color:  Color.fromARGB(255, 14, 12, 12),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        
  SizedBox(height: 30),
Row(
  children: [
    Text(
      'What to bring',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
)
 ,  SizedBox(height: 15),
      Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12), // Line color
      ),
 SizedBox(height: 15),
Row(
  children: [
    Text(
      'Know before you go',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
),
  SizedBox(height: 15),
        Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12),// Line color
      ),
     SizedBox(height: 15),

             Text(
          'Itinerary',
          style: TextStyle(
            color: Color.fromARGB(255, 14, 12, 12),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        
  SizedBox(height: 30),
Row(
  children: [
    Text(
      'See itinerary',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
)
 ,  SizedBox(height: 15),
      Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12),// Line color
      ),
 SizedBox(height: 15),
    
            SizedBox(height: 20),
            Center(child :
        Text(
          'Customer reviews',
          style: TextStyle(
            color: Color.fromARGB(255, 14, 12, 12),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),)
              ,  SizedBox(height: 30), 
Center(
  child: Row(
    mainAxisSize: MainAxisSize.min, // This ensures the Row takes up the minimum width needed
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
        '4.9 ',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
)

,
 SizedBox(height: 30), 
 Row(
                children: [
                   SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Guide',
                          style: TextStyle(
                            color: Color.fromARGB(255, 14, 12, 12),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
  ],
                    ),
                  ),
                  SizedBox(width: 40), // Space between containers
                  Container(
                    width: 50,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Service',
                          style: TextStyle(
                            color: Color.fromARGB(255, 14, 12, 12),
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        ),
                        SizedBox(height: 20),
 ],
                    ),
                  ),
                  SizedBox(width: 40),
                                    Container(
                    width: 50,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Organize',
                          style: TextStyle(
                            color: Color.fromARGB(255, 14, 12, 12),
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        ),
                        SizedBox(height: 20),
],
                    ),
                  ),
                 
  SizedBox(width: 40),
                                    Container(
                    width: 50,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Transport',
                          style: TextStyle(
                            color: Color.fromARGB(255, 14, 12, 12),
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        SizedBox(height: 20),
],
                    ),
                  ),
                 
              
],
              ),
            
          
               SizedBox(height: 20),
        Text(
          'Friday, Appril 5, 2024',
          style: TextStyle(
                      color: Color.fromARGB(255, 74, 73, 73),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                      letterSpacing: 0.10,
                    ),
        ),
                SizedBox(height: 20),         
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
                                          '4.9 ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                  SizedBox(height: 20),
                     Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/caption.jpg'),
            ),
            SizedBox(width: 10), // Space between the avatar and the text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'First Text',
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 12, 12),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Second Text',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      
        SizedBox(height: 20),
        Text(
          'Welcome to our club, where passions ignite and friendships thrive!\n Whether you\'re a seasoned enthusiast or a curious newcomer, our vibrant community offers something for everyone. Dive into a world of shared interests, lively discussions, and unforgettable experiences. Join us on a journey of exploration and connection, where every moment is an opportunity to create memories that last a lifetime. Come, be a part of our club and let\'s embark on exciting adventures together!',
          style: TextStyle(
            color: Color.fromARGB(255, 14, 12, 12),
            fontSize: 10,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
          ),
        ), 
      SizedBox(height: 30),
Row(
  children: [
    Text(
      'See all  reviews',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 12, 12),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    ),
    Spacer(), // This will push the icon to the right
    Padding(
      padding: EdgeInsets.only(right: 12.0), // Adjust the right padding as needed
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromARGB(255, 14, 12, 12),
        size: 18,
      ),
    ),
  ],
)
 ,  SizedBox(height: 15),
      Container(
        height: 2,
        width: double.infinity,
        color: Color.fromARGB(255, 14, 12, 12), // Line color
      ),
 
         SizedBox(height: 20),
        Text(
          'You might also like....',
          style: TextStyle(
            color: Color.fromARGB(255, 14, 12, 12),
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
            ,
                
                        ],
        
      ),                       
    
     
     
 
 
 
  ),
),
 ]))]))]),


      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 199, 223, 240), // Change the color as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('From', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                Text('25 DA per person', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to another class
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => availability()),
                );
              },
              child: Text('Check Availability'),
              ),
            
          ],
        ),
      ),
   
    );
  }
}


