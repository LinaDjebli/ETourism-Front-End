import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tro/screens/Profil/Noprofilescreen.dart';
import 'package:tro/screens/Profil/profile_screen.dart';
import 'package:tro/screens/activity/home2.dart';
import 'package:tro/screens/map/mapfile.dart';
import 'package:tro/screens/plan/planing.dart';
import 'package:tro/screens/sitetouristique/for_you/home.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
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

  void navigateToProfile(bool fromPage1) {
    setState(() {
      _currentIndex = 4; // Navigate to Profile tab (index 4)
      _pageController.jumpToPage(4); // Jump to page directly
      // You can add additional logic here based on `fromPage1` if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Tourist Sites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ballot_rounded),
              label: 'Planning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: foru(),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: MyHome2Page(title: 'Activity'),
                  );
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: MapPage(),
                  );
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: PlanningPage(title: 'Planning'),
                  );
                },
              );
            case 4:
              return CupertinoTabView(
                builder: (context) {
                  // Use a conditional check to decide which screen to show
                  //return fromPage1 ? NoProfile() : ProfileScreen();
                  return ProfileScreen();
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
