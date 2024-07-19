import 'package:flutter/material.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/availability.dart';


class WillayaPage extends StatefulWidget {
  @override
  _WillayaPage createState() => _WillayaPage();
}

class _WillayaPage extends State<WillayaPage> {
  Widget buildCategory0(String categoryName, VoidCallback onPressed, String imagePath, String imageText) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 140, // Adjusted width
        height: 280, // Adjusted height
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Container(
              width: 200, // Adjusted width
              height: 180, // Adjusted height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Added border radius
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6), // Space between image and text
            Container(
              width: double.infinity,
              height: 10, // Height of the category text
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(0, 5, 5, 5),
                borderRadius: BorderRadius.circular(5),
              ),
              child:
               Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12, // Adjusted font size
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              ),
            ),
  
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Continue in this willaya ",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 46, 42, 42),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.6,
                    decoration: BoxDecoration(
                      color: Colors.black,
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
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategory0('For you', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => availability()));
                      }, 'assets/caption.jpg', ''),

                      buildCategory0('Culture', () {}, 'assets/caption.jpg', ''),

                      buildCategory0('Sports', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => availability()));
                      }, 'assets/caption.jpg', ''),

                      buildCategory0('Nature', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => availability()));
                      }, 'assets/caption.jpg', ''),

                      buildCategory0('Hotel', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => availability()));
                      }, 'assets/caption.jpg', ''),

                      buildCategory0('Food', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => availability()));
                      }, 'assets/caption.jpg', ''),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

