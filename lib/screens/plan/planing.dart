import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tro/main.dart';

// Wilaya model
class Wilaya {
  final int id;
  final String name;
  final String description;
  final String picture;
  final int category;

  Wilaya({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.category,
  });

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      picture: json['picture'] ?? '',
      category: json['category'] ?? 0,
    );
  }
}

class Item {
  final int id;
  final String name;
  final String description;
  
  final String rating;
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
   
    required this.rating,
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
      
      rating: json['rating'],
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




class FilterPage extends StatefulWidget {
  final String initialVacationStyle;
  final String initialRatingFilter;
  final String initialSelectedDays;

  FilterPage({
    required this.initialVacationStyle,
    required this.initialRatingFilter,
    required this.initialSelectedDays,
  });

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late String vacationStyle;
  late String ratingFilter;
  late String selectedDays;

  @override
  void initState() {
    super.initState();
    vacationStyle = widget.initialVacationStyle;
    ratingFilter = widget.initialRatingFilter;
    selectedDays = widget.initialSelectedDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Options'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vacation Style',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: vacationStyle,
              onChanged: (newValue) {
                setState(() {
                  vacationStyle = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: <String>['relaxed', 'dynamique']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Rating Filter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: ratingFilter,
              onChanged: (newValue) {
                setState(() {
                  ratingFilter = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: <String>['all', '1-3', '4-5']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Number of Days',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedDays,
              onChanged: (newValue) {
                setState(() {
                  selectedDays = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: <String>['3', '9', '14']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('$value days'),
                );
              }).toList(),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'vacationStyle': vacationStyle,
                    'ratingFilter': ratingFilter,
                    'selectedDays': selectedDays,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Apply Filters',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanningPage extends StatefulWidget {
  final String title;

  const PlanningPage( {Key? key, required this.title}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPage();
}

class _PlanningPage extends State<PlanningPage> {
  List<Wilaya> wilayas = [];
  String searchQuery = '';
  int currentPage = 0;
  final int itemsPerPage = 6;
  String vacationStyle = 'relaxed'; // Default to relaxed
  String ratingFilter = 'all'; // Default to show all ratings
  String selectedDays = '3'; // Default to 3 days

  @override
  void initState() {
    super.initState();
    fetchWilayas();
  }

  Future<void> fetchWilayas() async {
    final response =
        await http.get(Uri.parse('http://192.168.180.128:8000/api/wilayat/'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        wilayas = data.map((json) => Wilaya.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load Wilayas');
    }
  }

  void _navigateToFilters(Wilaya wilaya) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterPage(
          initialVacationStyle: vacationStyle,
          initialRatingFilter: ratingFilter,
          initialSelectedDays: selectedDays,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        vacationStyle = result['vacationStyle'];
        ratingFilter = result['ratingFilter'];
        selectedDays = result['selectedDays'];
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WilayaItemsPage(
            wilayaId: wilaya.id,
            vacationStyle: vacationStyle,
            ratingFilter: ratingFilter,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Wilaya> filteredWilayas = wilayas.where((wilaya) {
      return wilaya.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    List<Wilaya> paginatedWilayas =
        filteredWilayas.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 2,
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
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Everything to make trip \n creation as you like',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Plan your trip for free',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 500,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.search,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchQuery = value;
                                      currentPage = 0;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Choose a destination',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(102, 255, 255, 255),
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
                          color: Color.fromARGB(255, 74, 96, 240),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 30, 30, 30)
                                  .withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: paginatedWilayas.length,
                      itemBuilder: (context, index) {
                        final wilaya = paginatedWilayas[index];
                        return GestureDetector(
                          onTap: () {
                            _navigateToFilters(wilaya);
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  wilaya.picture,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                wilaya.name,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentPage > 0)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentPage--;
                              });
                            },
                            child: Text('Previous'),
                          ),
                        if ((currentPage + 1) * itemsPerPage <
                            filteredWilayas.length)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentPage++;
                              });
                            },
                            child: Text('Next'),
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
    );
  }
}


class WilayaItemsPage extends StatefulWidget {
  final int wilayaId;
  final String vacationStyle;
  final String ratingFilter;

  WilayaItemsPage({
    required this.wilayaId,
    required this.vacationStyle,
    required this.ratingFilter,
  });

  @override
  _WilayaItemsPageState createState() => _WilayaItemsPageState();
}

class _WilayaItemsPageState extends State<WilayaItemsPage> {
  late Future<List<Item>> futureItems;
  late Future<Wilaya> futureWilaya;
  String selectedDays = '3'; // Default to 3 days
  int selectedDayIndex = 0; // Default to day 1

  @override
  void initState() {
    super.initState();
    futureWilaya = fetchWilaya(widget.wilayaId);
    futureItems = fetchItems(widget.wilayaId, widget.vacationStyle, int.parse(selectedDays));
  }

  Future<Wilaya> fetchWilaya(int wilayaId) async {
    final response = await http.get(Uri.parse('http://192.168.180.128:8000/api/wilayat/$wilayaId'));

    if (response.statusCode == 200) {
      return Wilaya.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load wilaya');
    }
  }

  Future<List<Item>> fetchItems(int wilayaId, String vacationStyle, int days) async {
    final response = await http.get(Uri.parse('http://192.168.180.128:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> allItems = jsonResponse.map((data) => Item.fromJson(data)).toList();

      // Filter items by wilayaId
      List<Item> wilayaItems = allItems.where((item) => item.wilayat == wilayaId).toList();

      // Apply additional filtering based on vacationStyle
      if (vacationStyle == 'relaxed') {
        // Take 3 items if available, otherwise take 2
        int takeCount = wilayaItems.length >= 3 ? 3 : 2;
        wilayaItems = wilayaItems.take(takeCount).toList();
      }

      // Organize items by days
      int itemsPerDay = (wilayaItems.length / days).ceil();
      List<List<Item>> organizedItems = [];
      for (int i = 0; i < days; i++) {
        organizedItems.add(wilayaItems.skip(i * itemsPerDay).take(itemsPerDay).toList());
      }

      return organizedItems.expand((i) => i).toList(); // Flatten the list
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items in Wilaya'),
      ),
      body: FutureBuilder(
        future: Future.wait([futureWilaya, futureItems]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            Wilaya wilaya = snapshot.data![0];
            List<Item> items = snapshot.data![1];

            List<List<Item>> daysItems = [];
            int days = int.parse(selectedDays);
            int itemsPerDay = (items.length / days).ceil();

            for (int i = 0; i < days; i++) {
              daysItems.add(items.skip(i * itemsPerDay).take(itemsPerDay).toList());
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Days',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    value: selectedDays,
                    onChanged: (newValue) {
                      setState(() {
                        selectedDays = newValue!;
                        futureItems = fetchItems(widget.wilayaId, widget.vacationStyle, int.parse(selectedDays));
                        selectedDayIndex = 0; // Reset to first day
                      });
                    },
                    items: <String>['3', '9', '14']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text('$value days'),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: selectedDayIndex == index ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text(
                              'Day ${index + 1}',
                              style: TextStyle(
                                color: selectedDayIndex == index ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: daysItems[selectedDayIndex].length,
                    itemBuilder: (context, itemIndex) {
                      Item item = daysItems[selectedDayIndex][itemIndex];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              item.picture,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.description),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

/*

class WilayaItemsPage extends StatefulWidget {
  final int wilayaId;
  final String vacationStyle;
  final String ratingFilter;

  WilayaItemsPage({
    required this.wilayaId,
    required this.vacationStyle,
    required this.ratingFilter,
  });

  @override
  _WilayaItemsPageState createState() => _WilayaItemsPageState();
}

class _WilayaItemsPageState extends State<WilayaItemsPage> {
  late Future<List<Item>> futureItems;
  late Future<Wilaya> futureWilaya;
  String selectedDays = '3'; // Default to 3 days
  int selectedDayIndex = 0; // Default to day 1

  @override
  void initState() {
    super.initState();
    futureWilaya = fetchWilaya(widget.wilayaId);
    futureItems = fetchItems(widget.wilayaId, widget.vacationStyle, widget.ratingFilter, int.parse(selectedDays));
  }

  Future<Wilaya> fetchWilaya(int wilayaId) async {
    final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/wilayat/$wilayaId'));

    if (response.statusCode == 200) {
      return Wilaya.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load wilaya');
    }
  }
Future<List<Item>> fetchItems(int wilayaId, String vacationStyle, String ratingFilter, int days) async {
  final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/items/'));
  final reviewsResponse = await http.get(Uri.parse('http://192.168.100.53:8000/api/reviews/'));

  if (response.statusCode == 200 && reviewsResponse.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    List<Item> allItems = jsonResponse.map((data) => Item.fromJson(data)).toList();

    List reviewsJsonResponse = json.decode(reviewsResponse.body);
    List<Review> allReviews = reviewsJsonResponse.map((data) => Review.fromJson(data)).toList();

    // Filter items by wilayaId
    List<Item> wilayaItems = allItems.where((item) => item.wilayat == wilayaId).toList();

    if (ratingFilter != 'all') {
      // Filter items based on reviews' ratings
      wilayaItems = wilayaItems.where((item) {
        List<Review> itemReviews = allReviews.where((review) => review.item == item.id).toList();

        // Handle case where there are no reviews
        if (itemReviews.isEmpty) {
          return ratingFilter == 'all'; // Return true if 'all' filter, false otherwise
        }

        // Calculate average rating, handling null ratings
        double averageRating = itemReviews
            .map((review) => review.rating) // Get all ratings
            .where((rating) => rating != null) // Filter out null ratings
            .isEmpty
            ? 0 // If no valid ratings, return 0
            : itemReviews
                .map((review) => review.rating!)
                .reduce((a, b) => a + b) / itemReviews.length;

        if (ratingFilter == '1-3') {
          return averageRating >= 1 && averageRating <= 3;
        } else if (ratingFilter == '4-5') {
          return averageRating >= 4 && averageRating <= 5;
        }

        return true; // For 'all' rating filter
      }).toList();
    }

    // Apply additional filtering based on vacationStyle
    if (vacationStyle == 'relaxed') {
      // Take 3 items if available, otherwise take 2
      int takeCount = wilayaItems.length >= 3 ? 3 : 2;
      wilayaItems = wilayaItems.take(takeCount).toList();
    }

    // Organize items by days
    int itemsPerDay = (wilayaItems.length / days).ceil();
    List<List<Item>> organizedItems = [];
    for (int i = 0; i < days; i++) {
      organizedItems.add(wilayaItems.skip(i * itemsPerDay).take(itemsPerDay).toList());
    }

    return organizedItems.expand((i) => i).toList(); // Flatten the list
  } else {
    throw Exception('Failed to load items or reviews');
  }
}




@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items in Wilaya'),
      ),
      body: FutureBuilder(
        future: Future.wait([futureWilaya, futureItems]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            Wilaya wilaya = snapshot.data![0];
            List<Item> items = snapshot.data![1];

            List<List<Item>> daysItems = [];
            int days = int.parse(selectedDays);
            int itemsPerDay = (items.length / days).ceil();

            for (int i = 0; i < days; i++) {
              daysItems.add(items.skip(i * itemsPerDay).take(itemsPerDay).toList());
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Days',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    value: selectedDays,
                    onChanged: (newValue) {
                      setState(() {
                        selectedDays = newValue!;
                        futureItems = fetchItems(widget.wilayaId, widget.vacationStyle, widget.ratingFilter, int.parse(selectedDays));
                        selectedDayIndex = 0; // Reset to first day
                      });
                    },
                    items: <String>['3', '9', '14']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text('$value days'),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: selectedDayIndex == index ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text(
                              'Day ${index + 1}',
                              style: TextStyle(
                                color: selectedDayIndex == index ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: daysItems[selectedDayIndex].length,
                    itemBuilder: (context, itemIndex) {
                      Item item = daysItems[selectedDayIndex][itemIndex];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              item.picture,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.description),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
*/

class Review {
  final int id;
  final String text;
  final int rating;
  final int item;

  Review({required this.id, required this.text, required this.rating, required this.item});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      text: json['text'],
      rating: json['rating'],
      item: json['item'],
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WilayaListPage extends StatefulWidget {
  @override
  _WilayaListPageState createState() => _WilayaListPageState();
}

class _WilayaListPageState extends State<WilayaListPage> {
  List<dynamic> wilayas = [];

  Future<void> fetchWilayas() async {
    final url = Uri.parse('http://192.168.100.53:8000/api/wilayat/'); // Use your host machine's IP address
    print("f1");
    try {
      final response = await http.get(url);
      print("f2");
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print("f3");
        List<dynamic> jsonResponse = json.decode(response.body);
        setState(() {
          wilayas = jsonResponse.map((data) => Wilaya.fromJson(data)).toList();
        });
      } else {
        print('Failed to load wilayas with status: ${response.statusCode}');
        throw Exception('Failed to load wilayas');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWilayas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Wilayas'),
      ),
      body: wilayas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: wilayas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(wilayas[index].picture),
                  title: Text(wilayas[index].name),
                  subtitle: Text(wilayas[index].description),
                  onTap: () {
                    // Naviguer vers une autre page ou effectuer une action au clic
                  },
                );
              },
            ),
    );
  }
}

class Wilaya {
  final int id;
  final String name;
  final String description;
  final String picture;

  Wilaya({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
  });

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
    );
  }
}
*/