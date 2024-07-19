import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:tro/screens/activity/home2.dart';
import 'package:tro/screens/map/mapfile.dart';
import 'package:tro/screens/plan/planing.dart';

class MapPage extends StatefulWidget {
  @override
  _ExamplePageState1 createState() => _ExamplePageState1();
}

class _ExamplePageState1 extends State<MapPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            color: Color.fromARGB(255, 2, 2, 2),
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
           Positioned(
              right: 0,
              left: MediaQuery.of(context).size.width * 0.15 - 45,
              top: MediaQuery.of(context).size.height * 2.65 - 40,
              child: Container(
                width: 550,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategory1('You might also like '),
                    ],
                  ),
                ),
              ),
            ),
  
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              CulturePage1(),
              MyHome2Page(title: 'title'),
              MapPage(),
              //PlanningPage(title: 'title')
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 70,
        backgroundColor: Color.fromARGB(255, 24, 24, 24),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.zoom_in),
            title: Text('Explore'),
            activeColor: const Color.fromARGB(255, 250, 251, 251),
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.people),
            title: Text('Guide'),
            activeColor: const Color.fromARGB(255, 252, 254, 253),
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.map_sharp),
            title: Text('Maps'),
            activeColor: const Color.fromARGB(255, 251, 253, 251),
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.plagiarism),
            title: Text('Planner'),
            activeColor: const Color.fromARGB(255, 252, 252, 252),
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }





 
    Widget buildCategory1(String text) {
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
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
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
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
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

 
  Widget buildCategory3(String text) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 74, 73, 73),
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
    );
  }


 Widget buildCategory4(String text) {
  return Container(
    width: 150,
    height: 38.25,
    margin: const EdgeInsets.only(right: 8),
    clipBehavior: Clip.antiAlias,
    decoration: const ShapeDecoration(
      color: Color.fromARGB(255, 5, 5, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(11),
          topRight: Radius.circular(11),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(11)
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
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 20,
              bottom: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start, // Adjust this line
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
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
  );
}

Widget buildCategory5(String text) {
  return Container(
    width: 120,
    height: 33.25,
    margin: const EdgeInsets.only(right: 4),
    clipBehavior: Clip.antiAlias,
    decoration: const ShapeDecoration(
      color: Color.fromARGB(255, 152, 22, 22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)
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
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 5,
              bottom: 16,
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
                    fontSize: 10,
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

  Widget buildCategory6(String text) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 23, 85, 255),
                      fontSize: 14,
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

}
