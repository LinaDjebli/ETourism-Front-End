import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:carousel_slider/carousel_slider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


 

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tro/Authentification/AgencySignup.dart';
import 'package:tro/Authentification/GuideSignup.dart';
import 'package:tro/Authentification/LOginChoice.dart';
import 'package:tro/Authentification/Signup.dart';
import 'package:tro/Componants/Map.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';
import 'package:tro/Create%20Activity/ActivityLocation.dart';
import 'package:tro/Create%20Activity/ActivityName.dart';
import 'package:tro/Create%20Activity/ActivityPageEight.dart';
import 'package:tro/Create%20Activity/ActivityPageFive.dart';
import 'package:tro/Create%20Activity/ActivityPageSeven.dart';
import 'package:tro/Create%20Activity/ActivityPageSix.dart';
import 'package:tro/Create%20Activity/ActivityPagenine.dart';
import 'package:tro/Create%20Activity/ActivityPageten.dart';
import 'package:tro/Create%20Activity/CreateActivity.dart';
import 'package:tro/Create%20Activity/fetchdata.dart';
import 'package:tro/intro_screens/introductionscreen.dart';
import 'package:tro/navigateur.dart';
import 'package:tro/screens/activitiesscreen.dart';
import 'package:tro/screens/plan/planing.dart';
import 'package:tro/screens2/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';










void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 55, 91, 222)),
        useMaterial3: true,
      ),
      routes: {
        '/pageOne': (context) =>  SignupPage(),
        '/pageTwo': (context) =>  GuideSignup(),
        '/pageThree': (context) => LoginChoice(),
        '/pageFour': (context) =>  AgencySignup(),
      },
      home:  IntroductionScreen()
    );
  }
}



class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final String regionsUrl = 'http://192.168.100.53:8000/api/regions/';
  final String itemsUrl = 'http://192.168.100.53:8000/api/items/';
  int _selectedIndex = 0;

  Future<List<Region>>? futureRegions;

  final List<String> categoryImages = [
    'assets/back.jpg',
    'assets/backk.jpg',
    'assets/backkkK.jpg',
    'assets/backkk.jpg',
    
  ];
  @override
  void initState() {
    super.initState();
    futureRegions = fetchRegions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: List.generate(categoryImages.length, (index) {
                    return buildCategoryWidget(index + 1, categoryImages[index]);
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildCategoryWidget(int categoryId, String imagePath) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 410, // Adjust height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: MediaQuery.of(context).size.width * 0.17 - 45,
              top: MediaQuery.of(context).size.height * 0.32 - 40,
              child: Container(
                width: 550,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20), // Padding for text content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s plan your next vacation in Algeria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Immerse yourself in some of the world’s most historic Bardo National Museum on',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
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
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height * 0.1 - 40,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 55,
                        width: 700,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.search, color: Colors.black),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchResultsPage(itemsUrl: itemsUrl),
                                      ),
                                    );
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Choose a destination',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      height: 51,
                      width: 51,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Color.fromRGBO(245, 246, 249, 1),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.auto_awesome_rounded,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color.fromARGB(255, 11, 141, 255),
          unselectedItemColor: Color.fromARGB(255, 92, 91, 91),
          items: [
         

            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined),
              label: 'Culture',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.nature_outlined),
              label: 'Nature',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hotel_outlined),
              label: 'Hotel',
            ),
          ],
        ),
        SizedBox(height: 20), // Space between BottomNavigationBar and next section
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20), // Padding for section content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Make your best experiences',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              ItemsByCategoryWidget(categoryId: categoryId),
            ],
          ),
        ),
        SizedBox(height: 20), // Space between sections
        FutureBuilder<List<Region>>(
          future: futureRegions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading regions. Please try again later.'));
            } else {
              final regions = snapshot.data ?? [];
              if (regions.isEmpty) {
                return Center(child: Text('No regions available.'));
              } else {
                return Column(
                  children: [
                    SizedBox(height: 20), // Space between sections
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20), // Padding for section content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zoning In Algeria',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10),
                          buildRegionRow([regions[0], regions[1]], context),
                          SizedBox(height: 20),
                          buildRegionRow([regions[2], regions[3]], context),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Space between sections
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20), // Padding for section content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Best Wilayat With These Activities',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10),
                          WilayatAndItemsWidget(categoryId: categoryId),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Space at the end
                  ],
                );
              }
            }
          },
        ),
      ],
    );
  }
 
  Widget buildRegionRow(List<Region> regions, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: regions.map((region) => buildRegionItem(region, context)).toList(),
    );
  }


List<String> regionImagePaths = [
  'assets/chhhh.jpg',
  'assets/chh.jpg',
  'assets/chhh.jpg',
  'assets/ch.jpg',
];

Widget buildRegionItem(Region region, BuildContext context) {
  
  String imagePath = regionImagePaths[region.id - 1]; 

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegionDetailPage(
            region: region,
            categoryId: _selectedIndex + 1,
          ),
        ),
      );
    },
    child: Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath), // Use specific region image
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 120,
            left: 15,
            child: Container(
              width: 100,
              height: 26,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 6, 25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text(
                region.regionType,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 10,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 95,
            left: 15,
            child: FutureBuilder<List<Item>>(
              future: fetchItems(_selectedIndex + 1, region.id), // Pass both categoryId and regionId
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final items = snapshot.data ?? [];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      '${items.length} activities ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
  
  Future<List<Item>> fetchItems(int categoryId, int regionId) async {
    final response = await http.get(Uri.parse('http:// 192.168.100.53:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> filteredItems = jsonResponse
          .map((data) => Item.fromJson(data))
          .where((item) => item.category == categoryId && item.region == regionId)
          .toList();
      return filteredItems;
    } else {
      throw Exception('Failed to load items');
    }
  }
 

  Future<List<Region>> fetchRegions() async {
    final response = await http.get(Uri.parse(regionsUrl));
    print('Regions API Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Region> regions = body.map((dynamic region) => Region.fromJson(region)).toList();
      regions.forEach((region) {
        print('Region: ${region.name}, Type: ${region.regionType}');
      });

      return regions;
    } else {
      throw Exception('Failed to load regions');
    }
  }
}
  
class ItemsByCategoryWidget extends StatefulWidget {
  final int categoryId;

  ItemsByCategoryWidget({required this.categoryId});

  @override
  _ItemsByCategoryWidgetState createState() => _ItemsByCategoryWidgetState();
}

class _ItemsByCategoryWidgetState extends State<ItemsByCategoryWidget> {
  List<Item> favoriteItems = [];
  List<dynamic> items = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: fetchItemsByCategory(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Item> uniqueItems = _getUniqueItems(snapshot.data!); // Filter unique items by name
          List<Item> topRatedItems = getTopRatedItems(uniqueItems, 7); // Get top 7 rated items

          return Positioned(
            bottom: 0,
            right: 0,
            left: MediaQuery.of(context).size.width * 0.17 - 45,
            top: MediaQuery.of(context).size.height * 0.35 - 40,
            child: Container(
              width: 500,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: topRatedItems.map((item) {
                    int index = topRatedItems.indexOf(item); // Get the index of the current item
                    bool isFavorite = favoriteItems.contains(item);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailPage(item: item, itemType: item.itemType),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 420,
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
                                          child: Image.network(
                                            item.picture,
                                            fit: BoxFit.cover,
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
                                              item.itemType,
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 123, 125, 123),
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item.name,
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            Row(
                                              children: [
                                                StarRating1(rating: item.averageRating), // Use StarRating widget
                                                SizedBox(width: 5),
                                                Text(
                                                  item.averageRating.toStringAsFixed(1), // Display numeric average rating
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    icon: Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (isFavorite) {
                                          favoriteItems.remove(item);
                                        } else {
                                          favoriteItems.add(item);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load items'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<Item>> fetchItemsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> allItems = jsonResponse.map((data) => Item.fromJson(data)).toList();
      List<Item> filteredItems = _getUniqueItems(allItems.where((item) => item.category == categoryId).toList());

      for (var item in filteredItems) {
        item.averageRating = await fetchAverageRating(item.id);
      }

      return filteredItems;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<double> fetchAverageRating(int itemId) async {
    final response = await http.get(Uri.parse('http://192.168.180.128:8000/api/items/$itemId/reviews/'));

    if (response.statusCode == 200) {
      List<dynamic> reviews = jsonDecode(response.body);

      if (reviews.isEmpty) {
        return 0.0;
      }

      double totalRating = 0.0;
      for (var review in reviews) {
        totalRating += (review['rating'] ?? 0);
      }
      return totalRating / reviews.length;
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  List<Item> _getUniqueItems(List<Item> items) {
    Set<String> itemNames = Set<String>();
    List<Item> uniqueItems = [];

    for (var item in items) {
      if (!itemNames.contains(item.name)) {
        itemNames.add(item.name);
        uniqueItems.add(item);
      }
    }

    return uniqueItems;
  }

  List<Item> getTopRatedItems(List<Item> items, int count) {
    items.sort((a, b) => b.averageRating.compareTo(a.averageRating));
    return items.take(count).toList();
  }
}




class SearchResultsPage extends StatefulWidget {
  final String itemsUrl;

  SearchResultsPage({required this.itemsUrl});

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late Future<List<Item>> futureItems;
  List<Item> allItems = [];
  List<Item> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems(widget.itemsUrl);
  }

  Future<List<Item>> fetchItems(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Item> items = body.map((dynamic item) => Item.fromJson(item)).toList();
      items = removeDuplicates(items);
      setState(() {
        allItems = items;
        filteredItems = items;
      });
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  List<Item> removeDuplicates(List<Item> items) {
    final Set<String> names = {};
    final List<Item> uniqueItems = [];
    for (var item in items) {
      if (!names.contains(item.name)) {
        names.add(item.name);
        uniqueItems.add(item);
      }
    }
    return uniqueItems;
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: MediaQuery.of(context).size.height * 0.1 - 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 55,
                      width: 700,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: 'Choose a destination',
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  filterItems(value);
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1 + 55,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<List<Item>>(
                    future: futureItems,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading items.'));
                      } else {
                        return ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return ListTile(
                              title: Text(item.name),
                              subtitle: Text(item.itemType),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromARGB(130, 0, 0, 0), width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    item.picture,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemDetailPage(item: item, itemType: item.itemType),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  

class ItemsByWilayaAndCategoryScreen extends StatefulWidget {
  final int wilayaId;
  final int categoryId;

  ItemsByWilayaAndCategoryScreen({required this.wilayaId, required this.categoryId});

  @override
  _ItemsByWilayaAndCategoryScreenState createState() => _ItemsByWilayaAndCategoryScreenState();
}

class _ItemsByWilayaAndCategoryScreenState extends State<ItemsByWilayaAndCategoryScreen> {
  late Future<List<Item>> futureItems;
  late Future<Wilaya> futureWilaya;
  List<Item> _sortedItems = []; // State variable to hold sorted items

  @override
  void initState() {
    super.initState();
    futureWilaya = fetchWilaya(widget.wilayaId);
    futureItems = fetchItems(widget.wilayaId, widget.categoryId);
  }

  Future<Wilaya> fetchWilaya(int wilayaId) async {
    final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/wilayat/$wilayaId'));

    if (response.statusCode == 200) {
      return Wilaya.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load wilaya');
    }
  }

  Future<List<Item>> fetchItems(int wilayaId, int categoryId) async {
    final response = await http.get(Uri.parse('http:// 192.168.100.53:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> allItems = jsonResponse.map((data) => Item.fromJson(data)).toList();
      List<Item> uniqueItems = _getUniqueItems(allItems); // Filter unique items by name

      // Initially store items in _sortedItems
      _sortedItems = uniqueItems.where((item) => item.wilayat == wilayaId && item.category == categoryId).toList();

      return _sortedItems;
    } else {
      throw Exception('Failed to load items');
    }
  }

  List<Item> _getUniqueItems(List<Item> items) {
    // Use a set to track seen item names
    Set<String> itemNames = Set<String>();
    List<Item> uniqueItems = [];

    for (var item in items) {
      if (!itemNames.contains(item.name)) {
        itemNames.add(item.name);
        uniqueItems.add(item);
      }
    }

    return uniqueItems;
  }

  void _sortItemsAlphabetically() {
    setState(() {
      _sortedItems.sort((a, b) => a.name.compareTo(b.name));
    });
  }

  void _sortItemsByDate() {
    setState(() {
      _sortedItems.sort((a, b) => b.name.compareTo(a.name)); // Sort by date descending
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Items",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 171, 220, 253),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([futureWilaya, futureItems]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data. Please try again later.'));
          } else {
            final wilaya = snapshot.data![0] as Wilaya;

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      wilaya.name,
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      wilaya.description,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    wilaya.picture,
                                    width: 400,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showSortOptions(context),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 33, 149, 243),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(196, 156, 155, 155),
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sort',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${_sortedItems.length} activities found',
                            style: TextStyle(
                              color: Color.fromARGB(255, 154, 151, 151),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _sortedItems.length,
                          itemBuilder: (context, index) {
                            return _buildItemCard(_sortedItems[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item, itemType: item.itemType),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 142, 171, 215),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.picture,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemType,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        '${item.timeString}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8,
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
                  SizedBox(width: 48),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text('Alphabetical'),
                onTap: () {
                  _sortItemsAlphabetically(); // Call sorting function
                  Navigator.pop(context); // Close bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rating'),
                onTap: () {
                  // Implement sorting logic for rating
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date'),
                onTap: () {
                  _sortItemsByDate(); // Call sorting function for date
                  Navigator.pop(context); // Close bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
 
class ItemDetailPage extends StatefulWidget {
  final Item item;
  final String itemType;

  ItemDetailPage({required this.item, required this.itemType});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentIndex = 0;
  List<dynamic> reviews = [];
  double rating = 0;
  bool showRatingSection = true;
  List<Item> similarItems = [];
  double averageRating = 0.0;

  Future<void> fetchReviews() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/${widget.item.id}/reviews/'));
      if (response.statusCode == 200) {
        setState(() {
          reviews = jsonDecode(response.body);
          calculateAverageRating(); // Calculate average rating after fetching reviews
        });
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }

  void addReview(dynamic newReview) {
    setState(() {
      reviews.add(newReview);
      showRatingSection = false;
    });
  }

  Future<void> fetchSimilarItems() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/?item_type=${widget.itemType}'));

      if (response.statusCode == 200) {
        List<Item> allItems = (jsonDecode(response.body) as List)
            .map((itemJson) => Item.fromJson(itemJson))
            .where((item) => item.itemType == widget.itemType)
            .toList();

        // Shuffle the list of items
        allItems.shuffle();

        // Select up to 5 random items
        setState(() {
          similarItems = allItems.take(5).toList();
          similarItems.forEach((item) {
            item.averageRating = calculateSimilarItemRating(item.id);
          });
        });
      } else {
        throw Exception('Failed to load similar items');
      }
    } catch (e) {
      print('Error fetching similar items: $e');
    }
  }

  double calculateSimilarItemRating(int itemId) {
    double totalRating = 0.0;
    int numberOfReviews = 0;

    // Calculate average rating for the item with itemId
    for (var review in reviews) {
      if (review['item_id'] == itemId) {
        totalRating += (review['rating'] ?? 0);
        numberOfReviews++;
      }
    }

    if (numberOfReviews == 0) {
      return 0.0;
    }

    return totalRating / numberOfReviews;
  }

  void calculateAverageRating() {
    if (reviews.isEmpty) {
      averageRating = 0.0;
      return;
    }

    double totalRating = 0.0;
    for (var review in reviews) {
      totalRating += (review['rating'] ?? 0);
    }
    averageRating = totalRating / reviews.length;
  }

  @override
  void initState() {
    super.initState();
    fetchReviews();
    fetchSimilarItems();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.item.picture,
      if (widget.item.picture1.isNotEmpty) widget.item.picture1,
      if (widget.item.picture2.isNotEmpty) widget.item.picture2,
      if (widget.item.picture3.isNotEmpty) widget.item.picture3,
      if (widget.item.picture4.isNotEmpty) widget.item.picture4,
    ];
    
        List<dynamic> randomReviews = [];
    if (reviews.isNotEmpty) {
      final random = Random();
      randomReviews = reviews.toList();
      randomReviews = randomReviews.take(4).toList();
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (images.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 20),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.35,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: images.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: images.length,
                    effect: ScrollingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 6,
                      dotWidth: 6,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )
            else
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'No image available',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'Price: ', // Replace with actual price
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Display price here
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      StarRating(rating: averageRating.toInt()), // Display star rating
                      SizedBox(width: 5),
                      Text(
                        averageRating.toStringAsFixed(1), // Display numeric average rating
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    '${reviews.length} reviews',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.item.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'About this activity',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Opening times: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.item.timeString,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Experience',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20),
                  ExpansionTile(
                    title: Text(
                      'Highlights',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 24,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(widget.item.highlight),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 1),
                  ExpansionTile(
                    title: Text(
                      'Full description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 24,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(widget.item.fullDescription),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Itinerary',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
// Inside your build method
ExpansionTile(
  title: Text(
    'Itinerary',
    style: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),
  trailing: Icon(
    Icons.arrow_drop_down,
    color: Colors.black,
    size: 24,
  ),
  children: [
    GestureDetector(
      onTap: () async {
        if (await canLaunch(widget.item.url)) {
          await launch(widget.item.url);
        } else {
          throw 'Could not launch ${widget.item.url}';
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          widget.item.url,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    SizedBox(height: 15),
  ],
),

                  SizedBox(height: 30),
                  if (showRatingSection)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rate this activity',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                                                Text(
                          'Tell others what you think',
                          style: TextStyle(
                            color: Color.fromARGB(255, 117, 116, 116),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReviewsScreen(
                                  item: widget.item,
                                  initialRating: rating,
                                  onReviewPosted: (newReviewData) {
                                    addReview(newReviewData);
                                  },
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: StarRatingSelector(
                              onChanged: (newRating) {
                                setState(() {
                                  rating = newRating;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewsScreen(
                                      item: widget.item,
                                      initialRating: newRating,
                                      onReviewPosted: (newReviewData) {
                                        addReview(newReviewData);
                                      },
                                    ),
                                  ),
                                );
                              },
                              rating: rating,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReviewsScreen(
                                  item: widget.item,
                                  initialRating: rating,
                                  onReviewPosted: (newReviewData) {
                                    addReview(newReviewData);
                                  },
                                ),
                              ),
                            );
                          },
                          child: Text('Write a review'),
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  else
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Your review',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    SizedBox(height: 16),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(''), // Replace with actual logic to fetch user profile pic
          radius: 20,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Name', // Replace with actual user name logic if needed
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 7),
              Text(
                'Reviews are public and include your\naccount and device info.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
    SizedBox(height: 8),
    Text(
      reviews.last['text'] ?? '',
      style: TextStyle(fontSize: 16),
    ),
    SizedBox(height: 8),
    Row(
      children: [
        StarRating(rating: reviews.last['rating'] ?? 0), // Display star rating
        SizedBox(width: 5),
        Text('${reviews.last['rating'] ?? ''}'), // Display numeric rating
      ],
    ),
    SizedBox(height: 8),
    Text(
      'Date: ${reviews.last['timestamp']}', // Replace with actual timestamp logic
      style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    SizedBox(height: 20),
  ],
),

   SizedBox(height: 20),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: randomReviews.length,
                    itemBuilder: (context, index) {
                      final review = randomReviews[index];
                      final reviewText = review['text'] ?? '';
                      final reviewRating = review['rating'] ?? 0;
                      final userProfilePic = review['user_profile_pic'] ?? ''; // Replace with actual profile pic URL logic

                      return Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // User information section
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(userProfilePic), // Profile picture
                                    radius: 20,
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'User Name', // Replace with actual user name logic if needed
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        'Reviews are public and include your\n account and device info.',
                                        style: TextStyle(fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              // Review content
                              if (reviewText.isNotEmpty)
                                Text(
                                  reviewText,
                                  style: TextStyle(fontSize: 16),
                                ),
                              if (reviewRating != 0)
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: StarRating(rating: reviewRating),
                                ),
                              SizedBox(height: 8),
                              Text(
                                'Date: ${review['timestamp']}',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
   
                  SizedBox(height: 20),
                                 ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllReviewsPage(reviews: reviews, item: widget.item),
                        ),
                      );
                    },
                    child: Text('View all reviews'),
                  ),
     SizedBox(height: 30),
 Row(
  mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
  children: [
    Text(
      'Customers reviews',
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
    ),
  ],
),
   SizedBox(height: 30),
 Row(
  mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
  children: [ StarRatin(rating: averageRating.toInt()), // Display star rating
    SizedBox(width: 5),
    Text(
      averageRating.toStringAsFixed(1), // Display numeric average rating
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
          SizedBox(height: 30),
              Row(
  mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
  children: [      Text(
                    '${reviews.length} reviews from customers',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),  ],
),
                 
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You might also like...',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 460, // Adjust height to fit the item container height
                        child:
ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: similarItems.length,
  itemBuilder: (context, index) {
    Item item = similarItems[index];

    // Skip current item being viewed
    if (item.id == widget.item.id) {
      return SizedBox.shrink(); // Skip rendering this item
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item, itemType: item.itemType),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 370,
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
                          child: Image.network(
                            item.picture,
                            fit: BoxFit.cover,
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
                              item.itemType,
                              style: TextStyle(
                                color: Color.fromARGB(255, 123, 125, 123),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item.name,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
),
  ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  
class _RegionDetailPageState extends State<RegionDetailPage> {
  late Future<List<Item>> futureItems;

  final Map<int, List<String>> regionImages = {
    1: [
      'assets/chhhh1.jpg',
      'assets/chhhh2.jpg',
      'assets/chhhh3.jpg',
    ],
    2: [
      'assets/chh1.jpg',
      'assets/chh2.jpg',
      'assets/chh3.jpg',
    ],
    3: [
      'assets/0a108c7adaefe04a07f6e4edb012b5f0.jpg',
      'assets/8nl0w46p1qo41.jpg',
      'assets/c6e809c5122beccc2e62bd6ec7603dc7_1.jpg',
    ],
    4: [
      'assets/002.jpg',
      'assets/jj.jpeg',
      'assets/S_233273.jpg',
    ],
  };

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems(widget.categoryId, widget.region.id);
  }

  Future<List<Item>> fetchItems(int categoryId, int regionId) async {
    final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> filteredItems = jsonResponse
          .map((data) => Item.fromJson(data))
          .where((item) => item.category == categoryId && item.region == regionId)
          .toList();
      return filteredItems;
    } else {
      throw Exception('Failed to load items');
    }
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8,
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
                  SizedBox(width: 48),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text('Alphabetical'),
                onTap: () {
                  _sortItemsAlphabetically();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rating'),
                onTap: () {
                  // Implement sorting logic for rating
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date'),
                onTap: () {
                  _sortItemsByDate(); // Call sorting function for date
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _sortItemsAlphabetically() {
    setState(() {
      futureItems = futureItems.then((items) {
        items.sort((a, b) => a.name.compareTo(b.name));
        return items;
      });
    });
  }

  void _sortItemsByDate() {
    setState(() {
      futureItems = futureItems.then((items) {
        items.sort((a, b) => b.name.compareTo(a.name)); // Sort by date descending
        return items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.region.name),
        backgroundColor: Color.fromARGB(255, 171, 220, 253),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Item>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading items. Please try again later.'));
          } else {
            final items = snapshot.data ?? [];
            if (items.isEmpty) {
              return Center(child: Text('No items available.'));
            } else {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            '${widget.region.regionType} in Algeria',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Description: ${widget.region.description}',
                            style: TextStyle(
                              color: Color.fromARGB(146, 65, 65, 65),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: regionImages[widget.region.id]!.length,
                              itemBuilder: (context, index) {
                                String imagePath = regionImages[widget.region.id]![index]; // Get image path for the current region

                                return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imagePath,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => _showSortOptions(context),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 33, 149, 243),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(196, 156, 155, 155),
                                  width: 2,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sort',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '${items.length} activities found',
                              style: TextStyle(
                                color: Color.fromARGB(255, 154, 151, 151),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return _buildItemCard(items[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item, itemType: item.itemType),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 142, 171, 215),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.picture,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemType,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        '${item.timeString}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 

class Item {
  final int id;
  final String name;
  final String description;
  double averageRating;
  
  final String itemType;
  final String fullDescription;
  final String highlight;
  final String url;
  final String timeString;
  final String picture;
  final String picture1;
  final String picture2;
  final String picture3;
  final String picture4;
  final int region;
  final int? wilayat;
  final int? category;

  Item({
    required this.id,
    required this.name,
    required this.description,
   this.averageRating = 0.0,
    
    required this.itemType,
    required this.fullDescription,
    required this.highlight,
    required this.url,
    required this.timeString,
    required this.picture,
    required this.picture1,
    required this.picture2,
    required this.picture3,
    required this.picture4,
    required this.region,
    this.wilayat,
    this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      
      
      itemType: json['item_type'],
      fullDescription: json['full_description'],
      highlight: json['highlight'],
      url: json['url'],
      timeString: json['time_string'],
      picture: json['picture'],
      picture1: json['picture1'] ?? '',
      picture2: json['picture2'] ?? '',
      picture3: json['picture3'] ?? '',
      picture4: json['picture4'] ?? '',
      region: json['region'],
      wilayat: json['wilayat'],
      category: json['category'],
    );
  }
}
   

class RegionDetailPage extends StatefulWidget {
  final Region region;
  final int categoryId;
 
  RegionDetailPage({required this.region, required this.categoryId});

  @override
  _RegionDetailPageState createState() => _RegionDetailPageState();
}


 class ReviewsScreen extends StatefulWidget {
  final Item item;
  final double initialRating;
  final Function(dynamic) onReviewPosted;

  ReviewsScreen({required this.item, required this.initialRating, required this.onReviewPosted});

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<dynamic> reviews = [];
  TextEditingController reviewController = TextEditingController();
  double rating = 0;
  int wordCount = 0; // Track word count

  // Method to count words
  int countWords(String text) {
    if (text.isEmpty) {
      return 0;
    }
    // Split the text by whitespace and count non-empty entries
    return text.trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
  }

  Future<void> fetchReviews() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/${widget.item.id}/reviews/'));
      if (response.statusCode == 200) {
        setState(() {
          reviews = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }

  Future<void> postReview() async {
    if (reviewController.text.isEmpty && rating == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please provide either a comment or a rating.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('http://192.168.180.128:8000/api/reviews/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'text': reviewController.text.isEmpty ? null : reviewController.text,
        'rating': rating == 0 ? null : rating.toInt(),
        'item': widget.item.id,
      }),
    );

    if (response.statusCode == 201) {
      // Parse the new review data from response.body or construct it
      dynamic newReviewData = jsonDecode(response.body); // Adjust as per your API response

      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Successful'),
          content: Text('Review posted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailPage(item: widget.item, itemType: 'your_item_type_here'),
                  ),
                );

                Navigator.pop(context);
                widget.onReviewPosted(newReviewData);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to post review.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating; // Initialize rating with initialRating from ItemDetailPage
    fetchReviews(); // Fetch reviews when screen loads

    // Add listener to track word count whenever text changes
    reviewController.addListener(() {
      setState(() {
        wordCount = countWords(reviewController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isOverLimit = reviewController.text.length > 500;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews for ${widget.item.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: isOverLimit ? null : postReview, // Disable button if over limit
                      child: Text('Post Review'),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name', // Replace with actual user name logic if needed
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Reviews are public and include your\n account and device info.',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: StarRatingSelector(
                      onChanged: (newRating) {
                        setState(() {
                          rating = newRating; // Update rating when user selects a new rating
                        });
                      },
                      rating: rating, // Pass current rating to StarRatingSelector
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: reviewController,
                    decoration: InputDecoration(
                      labelText: 'Describe your experience (optional)',
                      border: OutlineInputBorder(),
                      // Change border color based on limit
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: isOverLimit ? Colors.red : Theme.of(context).primaryColor),
                      ),
                    ),
                    maxLines: 2,
                    maxLength: 500, // Limit to 500 characters
                    // Disable text field if over limit
                    enabled: !isOverLimit,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Divider(),
            // Display existing reviews or a message if there are no reviews yet
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    reviewController.dispose(); // Dispose of reviewController when screen is disposed
    super.dispose();
  }
}
  

class AllReviewsPage extends StatefulWidget {
  final Item item;
  final List reviews;

  const AllReviewsPage({required this.item, required this.reviews});

  @override
  _AllReviewsPageState createState() => _AllReviewsPageState();
}

class _AllReviewsPageState extends State<AllReviewsPage> {
  List<dynamic> reviews = [];
  List<dynamic> filteredReviews = [];
  TextEditingController reviewController = TextEditingController();
  double rating = 0;
  int selectedFilter = 0; // 0: All, 1: 5 stars, 2: 4 stars, 3: 3 stars, 4: 2 stars, 5: 1 star
  int sortOption = 0; // 0: Most Relevant, 1: Most Recent, 2: Most Oldest
  double averageRating = 0.0;

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/${widget.item.id}/reviews/'));
    if (response.statusCode == 200) {
      List<dynamic> fetchedReviews = jsonDecode(response.body);
      // Sort reviews by timestamp in descending order
      fetchedReviews.sort((a, b) => DateTime.parse(b['timestamp']).compareTo(DateTime.parse(a['timestamp'])));
      setState(() {
        reviews = fetchedReviews;
        filteredReviews = fetchedReviews;
        calculateAverageRating();
      });
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  void calculateAverageRating() {
    if (reviews.isEmpty) {
      averageRating = 0.0;
      return;
    }

    double totalRating = 0.0;
    for (var review in reviews) {
      totalRating += (review['rating'] ?? 0);
    }
    averageRating = totalRating / reviews.length;
  }

  void filterReviews(int rating) {
    setState(() {
      selectedFilter = rating;
      if (rating == 0) {
        filteredReviews = reviews;
      } else {
        filteredReviews = reviews.where((review) => review['rating'] == rating).toList();
      }
      calculateAverageRating();
    });
  }

  void sortReviews() {
    if (sortOption == 1) {
      // Most Recent
      filteredReviews.sort((a, b) => DateTime.parse(b['timestamp']).compareTo(DateTime.parse(a['timestamp'])));
    } else if (sortOption == 2) {
      // Most Oldest
      filteredReviews.sort((a, b) => DateTime.parse(a['timestamp']).compareTo(DateTime.parse(b['timestamp'])));
    }
    setState(() {});
  }

  void showSortDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sort Reviews'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text('Most Recent'),
                value: 1,
                groupValue: sortOption,
                onChanged: (value) {
                  setState(() {
                    sortOption = value as int;
                  });
                  sortReviews();
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: Text('Most Oldest'),
                value: 2,
                groupValue: sortOption,
                onChanged: (value) {
                  setState(() {
                    sortOption = value as int;
                  });
                  sortReviews();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews for ${widget.item.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => filterReviews(0),
                    child: Text('All'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => filterReviews(5),
                    child: Text('5 Stars'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => filterReviews(4),
                    child: Text('4 Stars'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => filterReviews(3),
                    child: Text('3 Stars'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => filterReviews(2),
                    child: Text('2 Stars'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => filterReviews(1),
                    child: Text('1 Star'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(height: 20, thickness: 1),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: showSortDialog,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Most relevant',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: 
              ListView.builder(
                itemCount: filteredReviews.length,
                itemBuilder: (context, index) {
                  final review = filteredReviews[index];
                  final reviewText = review['text'] ?? '';
                  final reviewRating = review['rating'] ?? 0;
                  final userProfilePic = review['user_profile_pic'] ?? ''; // Replace with actual profile pic URL logic

                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // User information section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(userProfilePic), // Profile picture
                                radius: 20,
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Name', // Replace with actual user name logic if needed
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Reviews are public and include your\n account and device info.',
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          // Review content
                          if (reviewText.isNotEmpty)
                            Text(
                              reviewText,
                              style: TextStyle(fontSize: 16),
                            ),
                          if (reviewRating != 0)
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: StarRating(rating: reviewRating),
                            ),
                          SizedBox(height: 8),
                          Text(
                            'Date: ${review['timestamp']}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StarRating1 extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color color;

  StarRating1({this.rating = 0.0, this.starCount = 5, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star, color: color);
        } else if (index < rating) {
          return Icon(Icons.star_half, color: color);
        } else {
          return Icon(Icons.star_border, color: color);
        }
      }).map((widget) {
        return Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: widget,
        );
      }).toList(),
    );
  }
}
class StarRatin extends StatelessWidget {
  final int rating;

  const StarRatin({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating.toDouble(),
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 40,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
  

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating.toDouble(),
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
  
class StarRatingSelector extends StatelessWidget {
  final double rating;
  final ValueChanged<double> onChanged;

  const StarRatingSelector({Key? key, required this.rating, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onChanged,
    );
  }
}

 class FavoritesPage extends StatelessWidget {
  final List<Item> favoriteItems;

  FavoritesPage({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return ListTile(
            leading: Image.network(item.picture),
            title: Text(item.name),
            subtitle: Text(item.itemType),
          );
        },
      ),
    );
  }
}

class WilayatAndItemsWidget extends StatelessWidget {
  final int categoryId;

  WilayatAndItemsWidget({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Wilaya>>(
      future: fetchWilayatByCategory(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load wilayat'));
        } else {
          final wilayat = snapshot.data ?? [];
          return SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: wilayat.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WilayaCard(
                          wilaya: wilayat[index],
                          categoryId: categoryId,
                        ),
                      );
                    },
                  ),
                ),
 ],
            ),
          );
    }
      },
    );
  }

  Future<List<Wilaya>> fetchWilayatByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/wilayat/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Wilaya> filteredWilayat = jsonResponse
          .map((data) => Wilaya.fromJson(data))
          .where((wilaya) => wilaya.category == categoryId)
          .toList();
      return filteredWilayat;
    } else {
      throw Exception('Failed to load wilayat');
    }
  }
}

class WilayaCard extends StatelessWidget {
  final Wilaya wilaya;
  final int categoryId;

  const WilayaCard({Key? key, required this.wilaya, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsByWilayaAndCategoryScreen(
              wilayaId: wilaya.id,
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              wilaya.picture,
              fit: BoxFit.cover,
              height: 300,
              width: 220,
            ),
          ),
          Positioned(
            bottom: 20, // Adjust the bottom value to position the text higher or lower
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Text(
                wilaya.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
   
class Region {
  final int id;
  final String regionType;
  final String name;
  
  final String description;

  Region({
    required this.id,
    required this.regionType,
    required this.name,
    
    required this.description,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      regionType: json['region_type'],
      name: json['name'],
      
      description: json['description'],
    );
  }
}

class Wilaya {
  final int id;
  final String name;
  final String description;
  final String picture;
  final int? category;

  Wilaya({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    this.category,
  });

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
      category: json['category'],
    );
  }
}
 
class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['category'],
    );
  }
}
