import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart'; // Import the dart:io package
//import 'package:tro/Create%20Activity/fetchdata.dart';
 class DailyActivity {
  int activityid;
  String activityName;
  String guideName;
  int activityCategory;
  String activityType;
  List<Food> food;
  List<Transport> transport;
  String activityDescription;
  String activityLocation;
  String emergencyPhoneNumber;
  String cutOffTime;
  String meetingPoint;
  String groupSize;
  String dropoff;
  List<Price> prices;
  List<NotSuitableFor> notSuitableFor;
  List<NotAllowed> notAllowed;
  List<Includes> includes;
  List<NotIncludes> notIncludes;
  List<Highlights> highlights;
  List<Photo> photos;
  int publishedBy;
  String region;
  String startHour;
  String endHour;

  DailyActivity({
    required this.activityid,
    required this.activityName,
    required this.guideName,
    required this.activityCategory,
    required this.activityType,
    required this.food,
    required this.transport,
    required this.activityDescription,
    required this.activityLocation,
    required this.emergencyPhoneNumber,
    required this.cutOffTime,
    required this.meetingPoint,
    required this.groupSize,
    required this.dropoff,
    required this.prices,
    required this.notSuitableFor,
    required this.notAllowed,
    required this.includes,
    required this.notIncludes,
    required this.highlights,
    required this.photos,
    required this.publishedBy,
    required this.region,
    required this.startHour,
    required this.endHour,
  });

  factory DailyActivity.fromJson(Map<String, dynamic> json) {
    return DailyActivity(
      activityid: json['activity']['activity_id'],
      activityName: json['activity']['activity_name'],
      guideName: json['activity']['guide_name'],
      activityCategory: json['activity']['activity_category'],
      activityType: json['activity']['activity_type'],
      food: List<Food>.from(json['activity']['food'].map((x) => Food.fromJson(x))),
      transport: List<Transport>.from(json['activity']['transport'].map((x) => Transport.fromJson(x))),
      activityDescription: json['activity']['activity_description'],
      activityLocation: json['activity']['activity_location'],
      emergencyPhoneNumber: json['activity']['emergency_phone_number'],
      cutOffTime: json['activity']['cut_off_time'],
      meetingPoint: json['activity']['meeting_point'],
      groupSize: json['activity']['groupesize'],
      dropoff: json['activity']['dropoff'],
      prices: List<Price>.from(json['activity']['prices'].map((x) => Price.fromJson(x))),
      notSuitableFor: List<NotSuitableFor>.from(json['activity']['notsuitable_for'].map((x) => NotSuitableFor.fromJson(x))),
      notAllowed: List<NotAllowed>.from(json['activity']['not_allowed'].map((x) => NotAllowed.fromJson(x))),
      includes: List<Includes>.from(json['activity']['includes'].map((x) => Includes.fromJson(x))),
      notIncludes: List<NotIncludes>.from(json['activity']['not_includes'].map((x) => NotIncludes.fromJson(x))),
      highlights: List<Highlights>.from(json['activity']['highlights'].map((x) => Highlights.fromJson(x))),
      photos: List<Photo>.from(json['activity']['photos'].map((x) => Photo.fromJson(x))),
      publishedBy: json['activity']['published_by'],
      region: json['activity']['region'],
      startHour: json['start_hour'],
      endHour: json['end_hour'],
    );
  }
}
 class OnedayActivity {
  int activityid;
  String activityName;
  String guideName;
  int activityCategory;
  String activityType;
  List<Food> food;
  List<Transport> transport;
  String activityDescription;
  String activityLocation;
  String emergencyPhoneNumber;
  String cutOffTime;
  String meetingPoint;
  String groupSize;
  String dropoff;
  List<Price> prices;
  List<NotSuitableFor> notSuitableFor;
  List<NotAllowed> notAllowed;
  List<Includes> includes;
  List<NotIncludes> notIncludes;
  List<Highlights> highlights;
  List<Photo> photos;
  int publishedBy;
  String region;
  String startdate ; 
  String startHour;
  String endHour;

  OnedayActivity({
    required this.activityid,
    required this.activityName,
    required this.guideName,
    required this.activityCategory,
    required this.activityType,
    required this.food,
    required this.transport,
    required this.activityDescription,
    required this.activityLocation,
    required this.emergencyPhoneNumber,
    required this.cutOffTime,
    required this.meetingPoint,
    required this.groupSize,
    required this.dropoff,
    required this.prices,
    required this.notSuitableFor,
    required this.notAllowed,
    required this.includes,
    required this.notIncludes,
    required this.highlights,
    required this.photos,
    required this.publishedBy,
    required this.startdate,
    required this.region,
    required this.startHour,
    required this.endHour,
  });

  factory OnedayActivity.fromJson(Map<String, dynamic> json) {
    return OnedayActivity(
      activityid: json['activity']['activity_id'],
      activityName: json['activity']['activity_name'],
      guideName: json['activity']['guide_name'],
      activityCategory: json['activity']['activity_category'],
      activityType: json['activity']['activity_type'],
      food: List<Food>.from(json['activity']['food'].map((x) => Food.fromJson(x))),
      transport: List<Transport>.from(json['activity']['transport'].map((x) => Transport.fromJson(x))),
      activityDescription: json['activity']['activity_description'],
      activityLocation: json['activity']['activity_location'],
      emergencyPhoneNumber: json['activity']['emergency_phone_number'],
      cutOffTime: json['activity']['cut_off_time'],
      meetingPoint: json['activity']['meeting_point'],
      groupSize: json['activity']['groupesize'],
      dropoff: json['activity']['dropoff'],
      prices: List<Price>.from(json['activity']['prices'].map((x) => Price.fromJson(x))),
      notSuitableFor: List<NotSuitableFor>.from(json['activity']['notsuitable_for'].map((x) => NotSuitableFor.fromJson(x))),
      notAllowed: List<NotAllowed>.from(json['activity']['not_allowed'].map((x) => NotAllowed.fromJson(x))),
      includes: List<Includes>.from(json['activity']['includes'].map((x) => Includes.fromJson(x))),
      notIncludes: List<NotIncludes>.from(json['activity']['not_includes'].map((x) => NotIncludes.fromJson(x))),
      highlights: List<Highlights>.from(json['activity']['highlights'].map((x) => Highlights.fromJson(x))),
      photos: List<Photo>.from(json['activity']['photos'].map((x) => Photo.fromJson(x))),
      publishedBy: json['activity']['published_by'],
      region: json['activity']['region'],
      startdate: json['activity_date'],
      startHour: json['start_hour'],
      endHour: json['end_hour'],
    );
  }
  
}
class SpecificDurationActivity {
  int activityid;
  String activityName;
  String guideName;
  int activityCategory;
  String activityType;
  List<Food> food;
  List<Transport> transport;
  String activityDescription;
  String activityLocation;
  String emergencyPhoneNumber;
  String cutOffTime;
  String meetingPoint;
  String groupSize;
  String dropoff;
  List<Price> prices;
  List<NotSuitableFor> notSuitableFor;
  List<NotAllowed> notAllowed;
  List<Includes> includes;
  List<NotIncludes> notIncludes;
  List<Highlights> highlights;
  List<Photo> photos;
  int publishedBy;
  String region;
  String startdate ; 
  String enddate ; 
  String startHour;
  String endHour;

  SpecificDurationActivity({
    required this.activityid,
    required this.activityName,
    required this.guideName,
    required this.activityCategory,
    required this.activityType,
    required this.food,
    required this.transport,
    required this.activityDescription,
    required this.activityLocation,
    required this.emergencyPhoneNumber,
    required this.cutOffTime,
    required this.meetingPoint,
    required this.groupSize,
    required this.dropoff,
    required this.prices,
    required this.notSuitableFor,
    required this.notAllowed,
    required this.includes,
    required this.notIncludes,
    required this.highlights,
    required this.photos,
    required this.publishedBy,
    required this.startdate,
    required this.enddate,
    required this.region,
    required this.startHour,
    required this.endHour,
  });

  factory SpecificDurationActivity.fromJson(Map<String, dynamic> json) {
    return SpecificDurationActivity(
      activityid: json['activity']['activity_id'],
      activityName: json['activity']['activity_name'],
      guideName: json['activity']['guide_name'],
      activityCategory: json['activity']['activity_category'],
      activityType: json['activity']['activity_type'],
      food: List<Food>.from(json['activity']['food'].map((x) => Food.fromJson(x))),
      transport: List<Transport>.from(json['activity']['transport'].map((x) => Transport.fromJson(x))),
      activityDescription: json['activity']['activity_description'],
      activityLocation: json['activity']['activity_location'],
      emergencyPhoneNumber: json['activity']['emergency_phone_number'],
      cutOffTime: json['activity']['cut_off_time'],
      meetingPoint: json['activity']['meeting_point'],
      groupSize: json['activity']['groupesize'],
      dropoff: json['activity']['dropoff'],
      prices: List<Price>.from(json['activity']['prices'].map((x) => Price.fromJson(x))),
      notSuitableFor: List<NotSuitableFor>.from(json['activity']['notsuitable_for'].map((x) => NotSuitableFor.fromJson(x))),
      notAllowed: List<NotAllowed>.from(json['activity']['not_allowed'].map((x) => NotAllowed.fromJson(x))),
      includes: List<Includes>.from(json['activity']['includes'].map((x) => Includes.fromJson(x))),
      notIncludes: List<NotIncludes>.from(json['activity']['not_includes'].map((x) => NotIncludes.fromJson(x))),
      highlights: List<Highlights>.from(json['activity']['highlights'].map((x) => Highlights.fromJson(x))),
      photos: List<Photo>.from(json['activity']['photos'].map((x) => Photo.fromJson(x))),
      publishedBy: json['activity']['published_by'],
      region: json['activity']['region'],
      startdate: json['activity_start_date'],
      enddate: json['activity_end_date'],
      startHour: json['start_hour'],
      endHour: json['end_hour'],
    );
  }}
class WeeklyActivity {
  int activityid;
  String activityName;
  String guideName;
  int activityCategory;
  String activityType;
  List<Food> food;
  List<Transport> transport;
  String activityDescription;
  String activityLocation;
  String emergencyPhoneNumber;
  String cutOffTime;
  String meetingPoint;
  String groupSize;
  String dropoff;
  List<Price> prices;
  List<NotSuitableFor> notSuitableFor;
  List<NotAllowed> notAllowed;
  List<Includes> includes;
  List<NotIncludes> notIncludes;
  List<Highlights> highlights;
  List<Photo> photos;
  int publishedBy;
  String region;
  List<String> days ; 
  String startHour;
  String endHour;

  WeeklyActivity({
    required this.activityid,
    required this.activityName,
    required this.guideName,
    required this.activityCategory,
    required this.activityType,
    required this.food,
    required this.transport,
    required this.activityDescription,
    required this.activityLocation,
    required this.emergencyPhoneNumber,
    required this.cutOffTime,
    required this.meetingPoint,
    required this.groupSize,
    required this.dropoff,
    required this.prices,
    required this.notSuitableFor,
    required this.notAllowed,
    required this.includes,
    required this.notIncludes,
    required this.highlights,
    required this.photos,
    required this.publishedBy,
    required this.days,
    required this.region,
    required this.startHour,
    required this.endHour,
  });

  factory WeeklyActivity.fromJson(Map<String, dynamic> json) {
    return WeeklyActivity(
      activityid: json['activity']['activity_id'],
      activityName: json['activity']['activity_name'],
      guideName: json['activity']['guide_name'],
      activityCategory: json['activity']['activity_category'],
      activityType: json['activity']['activity_type'],
      food: List<Food>.from(json['activity']['food'].map((x) => Food.fromJson(x))),
      transport: List<Transport>.from(json['activity']['transport'].map((x) => Transport.fromJson(x))),
      activityDescription: json['activity']['activity_description'],
      activityLocation: json['activity']['activity_location'],
      emergencyPhoneNumber: json['activity']['emergency_phone_number'],
      cutOffTime: json['activity']['cut_off_time'],
      meetingPoint: json['activity']['meeting_point'],
      groupSize: json['activity']['groupesize'],
      dropoff: json['activity']['dropoff'],
      prices: List<Price>.from(json['activity']['prices'].map((x) => Price.fromJson(x))),
      notSuitableFor: List<NotSuitableFor>.from(json['activity']['notsuitable_for'].map((x) => NotSuitableFor.fromJson(x))),
      notAllowed: List<NotAllowed>.from(json['activity']['not_allowed'].map((x) => NotAllowed.fromJson(x))),
      includes: List<Includes>.from(json['activity']['includes'].map((x) => Includes.fromJson(x))),
      notIncludes: List<NotIncludes>.from(json['activity']['not_includes'].map((x) => NotIncludes.fromJson(x))),
      highlights: List<Highlights>.from(json['activity']['highlights'].map((x) => Highlights.fromJson(x))),
      photos: List<Photo>.from(json['activity']['photos'].map((x) => Photo.fromJson(x))),
      publishedBy: json['activity']['published_by'],
      region: json['activity']['region'],
      days: List<String>.from(json['days']),
      startHour: json['start_hour'],
      endHour: json['end_hour'],
    );
  }}

class Food {
  String food;

  Food({
    required this.food,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      food: json['food'],
    );
  }
}

class Transport {
  String transport;

  Transport({
    required this.transport,
  });

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      transport: json['transport'],
    );
  }
}

class Price {
  String priceType;
  int numberOfClients;
  double price;

  Price({
    required this.priceType,
    required this.numberOfClients,
    required this.price,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      priceType: json['price_type'],
      numberOfClients: json['number_of_clients'],
      price: json['price'].toDouble(),
    );
  }
}

class NotSuitableFor {
  String description;

  NotSuitableFor({
    required this.description,
  });

  factory NotSuitableFor.fromJson(Map<String, dynamic> json) {
    return NotSuitableFor(
      description: json['description'],
    );
  }
}

class NotAllowed {
  String description;

  NotAllowed({
    required this.description,
  });

  factory NotAllowed.fromJson(Map<String, dynamic> json) {
    return NotAllowed(
      description: json['description'],
    );
  }
}

class Includes {
  String description;

  Includes({
    required this.description,
  });

  factory Includes.fromJson(Map<String, dynamic> json) {
    return Includes(
      description: json['description'],
    );
  }
}

class NotIncludes {
  String description;

  NotIncludes({
    required this.description,
  });

  factory NotIncludes.fromJson(Map<String, dynamic> json) {
    return NotIncludes(
      description: json['description'],
    );
  }
}

class Highlights {
  String description;

  Highlights({
    required this.description,
  });

  factory Highlights.fromJson(Map<String, dynamic> json) {
    return Highlights(
      description: json['description'],
    );
  }
}

class Photo {
  String file;

  Photo({
    required this.file,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      file: json['File'],
    );
  }
}
  List<DailyActivity> _activities = [];
class ActivityListScreen extends StatefulWidget {
  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {


  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    final apiUrl = 'http://192.168.100.53:8000/api/api/dailyactivities/'; // Replace with your API URL

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<DailyActivity> activities = body.map((dynamic item) => DailyActivity.fromJson(item)).toList();

        setState(() {
          _activities = activities;
        });
      } else {
        throw Exception('Failed to load activities');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
    print(_activities);
   
  }

  void navigateToActivityDetails(DailyActivity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ActivityDetailsScreen(activity: activity)),
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  sortActivitiesByName();
                  Navigator.pop(context);
                },
                child: Text('Sort by Name (A-Z)'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  sortActivitiesByDate();
                  Navigator.pop(context);
                },
                child: Text('Sort by Date (Newest first)'),
              ),
            ],
          ),
        );
      },
    );
  }

  void sortActivitiesByName() {
    _activities.sort((a, b) => a.activityName.compareTo(b.activityName));
    setState(() {});
  }

  void sortActivitiesByDate() {
    _activities.sort((a, b) => b.activityName.compareTo(a.activityName));
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity List'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1 - 40,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activity List',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                                    child: Icon(Icons.search, color: Colors.black),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Search activities',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
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
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
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
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.notifications,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '${_activities.length} activities found',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.find_replace_outlined,
                            color: Colors.black,
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
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.swap_vert,
                                  color: Colors.blue,
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
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.29,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.0), // Add padding to the ListView
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                var activity = _activities[index];
              // var  prices = activity.prices[index];
              // print(prices);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateToActivityDetails(activity);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/caption.jpg', // Replace with your image asset
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity.activityName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    activity.activityType,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Date: ${activity.activityName}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                   ...activity.prices.map((price) {
                          return Text(
                            'Price: ${price.priceType} DA (${price.price})',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          );
                        }).toList(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Add space between each activity
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchActivities();
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ActivityDetailsScreen extends StatefulWidget {
  final DailyActivity activity;

  ActivityDetailsScreen({required this.activity});

  @override
  _ActivityDetailsScreenState createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  int _currentIndex = 0;
   
  @override
  Widget build(BuildContext context) {
      List<Photo> photos =   widget.activity.photos ; 
       const String baseUrl = 'http://192.168.100.53:8000/';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity.activityName),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: photos.map((photo) {
                  String imageUrl = '$baseUrl${photo.file}';
                  return Container(
                    width: 200, // Adjust width as needed
                    height: 200, // Adjust height as needed
                    margin: EdgeInsets.all(8.0), // Add margin for spacing between images
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Text('Failed to load image'));
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    widget.activity.activityName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Activity provider: ${widget.activity.publishedBy}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 37, 113, 235),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    ' ${widget.activity.activityType}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    widget.activity.activityDescription,
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reserve now & pay later',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'keep your travel plans flexible - book your spot \n and pay later',
                            style: TextStyle(
                              color: Color.fromARGB(97, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Check Itinerary to see starting time',
                            style: TextStyle(
                              color: Color.fromARGB(97, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Live Tour guide',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.activity.guideName,
                            style: TextStyle(
                              color: Color.fromARGB(97, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Itinerary',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  ListTile(
                    title: Text(
                      'See itinerary',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItineraryPage(activity: widget.activity, weeklyActivities:_activities ),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 30),
                  Text(
                    'Experience',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  ListTile(
                    title: Text(
                      'Highlights',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HighlightPage(
                            highlights: widget.activity.highlights.map((highlight) => highlight.description).toList(),
                            includes: widget.activity.includes.map((include) => include.description).toList(),
                            notIncludes: widget.activity.notIncludes.map((notInclude) => notInclude.description).toList(),
                            suitableFor: widget.activity.notSuitableFor.map((suitableFor) => suitableFor.description).toList(),
                            prices: widget.activity.prices,
                            notAllowed: widget.activity.notAllowed,
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Includes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HighlightPage(
                            highlights: widget.activity.highlights.map((highlight) => highlight.description).toList(),
                            includes: widget.activity.includes.map((include) => include.description).toList(),
                            notIncludes: widget.activity.notIncludes.map((notInclude) => notInclude.description).toList(),
                            suitableFor: widget.activity.notSuitableFor.map((suitableFor) => suitableFor.description).toList(),
                            prices: widget.activity.prices,
                            notAllowed: widget.activity.notAllowed,
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Suitable for',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HighlightPage(
                            highlights: widget.activity.highlights.map((highlight) => highlight.description).toList(),
                            includes: widget.activity.includes.map((include) => include.description).toList(),
                            notIncludes: widget.activity.notIncludes.map((notInclude) => notInclude.description).toList(),
                            suitableFor: widget.activity.notSuitableFor.map((suitableFor) => suitableFor.description).toList(),
                            prices: widget.activity.prices,
                            notAllowed: widget.activity.notAllowed,
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HighlightPage(
                            highlights: widget.activity.highlights.map((highlight) => highlight.description).toList(),
                            includes: widget.activity.includes.map((include) => include.description).toList(),
                            notIncludes: widget.activity.notIncludes.map((notInclude) => notInclude.description).toList(),
                            suitableFor: widget.activity.notSuitableFor.map((suitableFor) => suitableFor.description).toList(),
                            prices: widget.activity.prices,
                            notAllowed: widget.activity.notAllowed,
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
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
              // Text('Price: ${widget.activity.prices.firstWhere((price) => price.priceType == "ADULT").price} DA'),
        
              ],
            ),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AvailabilityPage(
          activityName: widget.activity.activityName,
          activityLocation: widget.activity.activityLocation,
          activityDescription: widget.activity.activityDescription,
          guideName: widget.activity.guideName,
          prices: widget.activity.prices,
         // weeklyActivities: widget.activity.weeklyActivity, // Pass the weekly activities
        ),
      ),
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
class AvailabilityPage extends StatefulWidget {
  final String activityName;
  final String activityLocation;
  final String activityDescription;
  final String guideName;
  final List<Price> prices; // Assuming Price is a class representing price details
  //final List<WeeklyActivity> weeklyActivities; // Add this line to accept weekly activities

  AvailabilityPage({
    required this.activityName,
    required this.activityDescription,
    required this.guideName,
    required this.prices,
    required this.activityLocation,
 //   required this.weeklyActivities, // Add this line to accept weekly activities
  });

  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}
  
class _AvailabilityPageState extends State<AvailabilityPage> {
 // List to store counts for each price type dynamically
  late double totalPrice = 0.0; // Total price based on counts and prices
  List<Price> prices = [];
 
   
   
 /* void _setPrices() {
    for (var price in widget.prices) {
    /*  if (price.priceType == 'ADULT') {
        adultPrice = price.price;
      } else if (price.priceType == 'CHILD') {
        childrenPrice = price.price;
      }*/
       adultPrice = price.price;
       childrenPrice = price.price;
    }
  }*/

  /*double calculateTotalPrice() {
    return (adultCount * adultPrice) + (childrenCount * childrenPrice) + (infantCount * infantPrice);
  }*/
   
  Map<int, int> counts = {};

  @override
  void initState() {
    super.initState();
    // Initialize the counts for each price type
    for (int i = 0; i < widget.prices.length; i++) {
      counts[i] = 0;
    }
  }

  void _updateTotalPrice(double price, int countChange) {
    setState(() {
      totalPrice += price * countChange;
    });
  }

  void _updateCount(int index, int newCount) {
    setState(() {
      counts[index] = newCount;
    });
  }
  String _truncateText(String text, int wordLimit) {
    List<String> words = text.split(' ');
    if (words.length <= wordLimit) {
      return text;
    } else {
      return words.sublist(0, wordLimit).join(' ') + '...';
    }
  }
double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var price in prices) {
      totalPrice += price.price;
    }
    return totalPrice;
  }
  @override
  Widget build(BuildContext context) {
    // counts = List<int>.filled(prices.length, 0);
     print(counts);
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability for ${widget.activityName}'), // Display activity name here
        backgroundColor: Colors.blue,
      ),
      body:
       Column(
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
                        child: Container(
                          width: 550,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Top text
                              Text(
                                'Activity details',
                                style: TextStyle(
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
                                child: Padding(
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
                                                            ),
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

                                                                Column(
                    children: widget.prices.asMap().entries.map((entry) {
                          int index = entry.key;
                          Price price = entry.value;
                          return PriceRow(
                            price: price,
                            count: counts[index]!,
                            onCountChanged: (price, countChange) {
                              _updateTotalPrice(price, countChange);
                              _updateCount(index, counts[index]! + countChange);
                            },
                          );
                        }).toList(),
                      ),
                                                              /*  Row(
                                                                  children: [
                                                                      ...widget.prices.map((price) {
                          return Text(
                            'Price: ${price.priceType} DA (${price.price})',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          );
                        }).toList(),
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
                                                                */
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
                                                     // _updateTotalPrice();
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
                                                               '',//   _truncateText('$adultCount Adult, $childrenCount Children, $infantCount Infant', 3),
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
                )  ,]
                )
                )
                ),
             SizedBox(height: 10),
                                 Positioned(
                        bottom: 0,
                        right:MediaQuery.of(context).size.width * 0.148 - 45,
                        left: MediaQuery.of(context).size.width * 0.17 - 45,
                        top: MediaQuery.of(context).size.height * 0.38 - 40,
                        child: Container(
                          width: 550,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
  SizedBox(height: 12),
 Container(
                          width: 550,
                          child:Row(
        children: [
          Flexible(
            child: Container(
             
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: Color.fromARGB(255, 53, 52, 53),
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Allows Column to wrap its content
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
                              widget.activityName,
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
                              widget.activityDescription,
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
                              widget.guideName,
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
                              widget.activityLocation,
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
                        /*Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.weeklyActivities.map((activity) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${activity.day}: ${activity.startHour} - ${activity.endHour}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                          )
                          ),
                        ),
                      ],
                    ),
                  ),*/
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(218, 193, 192, 192),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                                    '${totalPrice}\da',
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
              activityName: widget.activityName,
              startingTime: widget.activityLocation, // Replace with actual starting time if needed
              totalPrice: totalPrice.toInt(), // Replace with actual total price if needed
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
        ]),
                          
                          ),)]
      ),
    ),
                            ]))
),



  ]
  )
  )   
  

  
  ]
  )
  )
  ]
  )
  
  
  );
  
          
              }



 
 
 
}
    
   
class ItineraryPage extends StatelessWidget {
  final DailyActivity activity;
  final List<DailyActivity> weeklyActivities;

  ItineraryPage({required this.activity, required this.weeklyActivities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itinerary'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main stop section
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Main Stop: ${activity.activityLocation}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),

            // Meeting point section
            _buildSection(
              icon: Icons.location_on,
              title: 'Meeting Point',
              content: activity.meetingPoint,
            ),
            Divider(),

            // Drop-off section
            _buildSection(
              icon: Icons.location_on,
              title: 'Drop-off',
              content: activity.dropoff,
            ),
            Divider(),

            // Food section
            if (activity.food.isNotEmpty) ...{
              _buildSection(
                icon: Icons.fastfood,
                title: 'Food',
                content: activity.food.map((food) => food.food.toString() ).toString()
              ),
              Divider(),
            },

            // Transport section
            if (activity.transport.isNotEmpty) ...{
              _buildSection(
                icon: Icons.directions_car,
                title: 'Transport',
                content:activity.transport.map((transport) => transport.transport.toString() ).toString()
              ),
              Divider(),
            },

            // Weekly activities section
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Time',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 8.0),

            Icon(Icons.calendar_month),


           /* ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: weeklyActivities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text(
                   ': ${weeklyActivities[index].startHour} - ${weeklyActivities[index].endHour}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required IconData icon, required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
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
 
class HighlightPage extends StatelessWidget {
  final List<String> highlights;
  final List<String> includes;
  final List<String> notIncludes;
  final List<String> suitableFor;
  final List<Price> prices;
  final List<NotAllowed> notAllowed;

  HighlightPage({
    required this.highlights,
    required this.includes,
    required this.notIncludes,
    required this.suitableFor,
    required this.prices,
    required this.notAllowed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Highlights',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: highlights.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: TextStyle(fontSize: 20)),
                        Expanded(
                          child: Text(
                            highlights[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              Text(
                'Includes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              _buildIconList(Icons.check, Colors.green, includes),
              SizedBox(height: 15),
              Text(
                'Not Includes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              _buildIconList(Icons.close, Colors.red, notIncludes),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              Text(
                'Suitable For',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              _buildTextList(Icons.star, suitableFor),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              Text(
                'Prices',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              _buildPriceList(prices),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              Text(
                'Not Allowed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              _buildTextList(Icons.block, notAllowed.map((na) => na.description).toList()),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconList(IconData iconData, Color iconColor, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(iconData, color: iconColor, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextList(IconData iconData, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(iconData, color: Colors.yellow, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceList(List<Price> prices) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prices.map((price) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text('${price.priceType}: ${price.price}'),
          ),
        );
      }).toList(),
    );
  }
}
class PriceRow extends StatefulWidget {
  final Price price;
  final int count;
  final Function(double, int) onCountChanged;

  PriceRow({required this.price, required this.count, required this.onCountChanged});

  @override
  _PriceRowState createState() => _PriceRowState();
}

class _PriceRowState extends State<PriceRow> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  void _incrementCount() {
    setState(() {
      count++;
    });
    widget.onCountChanged(widget.price.price, 1); // Increment the total price
  }

  void _decrementCount() {
    if (count > 0) {
      setState(() {
        count--;
      });
      widget.onCountChanged(widget.price.price, -1); // Decrement the total price
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Price: ${widget.price.priceType} DA (${widget.price.price})',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: _decrementCount,
          child: Icon(
            Icons.remove_circle,
            size: 35,
            color: Color.fromARGB(255, 43, 112, 190),
          ),
        ),
        SizedBox(width: 12),
        Text(
          '$count',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
          ),
        ),
        SizedBox(width: 12),
        GestureDetector(
          onTap: _incrementCount,
          child: Icon(
            Icons.add_circle,
            size: 35,
            color: Color.fromARGB(255, 43, 112, 190),
          ),
        ),
      ],
    );
  }
}




class ReservePage extends StatefulWidget {
  final String activityName;
  final String startingTime;
  final int totalPrice;

  ReservePage({
    required this.activityName,
    required this.startingTime,
    required this.totalPrice,
  });

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
TextEditingController wilaya = TextEditingController();
  Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = prefs.getString('firstname') ?? 'No first name';
    String lastName = prefs.getString('lastname') ?? 'No last name';
    String email = prefs.getString('email') ?? 'No email';
    String phonenumber = prefs.getString('phonemuber')?? 'No phone';

    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phonenumber': phonenumber,
    };
  }

  Future<void> _loadUserData() async {
    Map<String, String> userData = await getUserData();

    setState(() {
      _firstName.text = userData['firstName']!;
      _lastName.text = userData['lastName']!;
      _email.text = userData['email']!;
      phonenumber.text = userData['phonenumber']!;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
Future<void> createBooking() async {
    final url = 'http://192.168.100.53:8000/api/create-booking/'; // Replace with your actual endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstname': _firstName.text,
        'lastname': _lastName.text,
        'email': _email.text,
        'age': 12,//int.parse(_age),
        'wilaya':  wilaya.text,
        'phonenumber': phonenumber.text,
        'number_of_tickets': 1,
        'activity': 1, // Replace with the actual activity ID
        'total_price': widget.totalPrice, // This might be calculated on the backend
      }),
    );

    if (response.statusCode == 201) {
      // Booking created successfully
      final data = jsonDecode(response.body);
      print('Booking ID: ${data['booking_id']}');
      // Handle successful booking creation
    } else {
      // Failed to create booking
      print('Failed to create booking: ${response.body}');
      // Handle error
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wish List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your personal details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.lock, color: Color.fromARGB(255, 85, 171, 237)),
                SizedBox(width: 8),
                Text('Checkout is fast and secure', style: TextStyle(color: Color.fromARGB(255, 85, 191, 237))),
              ],
            ),
            SizedBox(height: 20),
            buildTextField(_firstName,'First name*', _firstName.text),
            SizedBox(height: 16),
            buildTextField(_lastName,'Last name*', _lastName.text),
            SizedBox(height: 16),
            buildTextField(_email,'Email address*', _email.text),
            SizedBox(height: 16),
            buildTextField(wilaya,'Willaya*',wilaya.text),
            SizedBox(height: 16),
            buildTextField(phonenumber,'Mobile phone number*', phonenumber.text),
            SizedBox(height: 16),
            Text(
              'We\'ll only contact you with essential updates or changes to your booking',
              style: TextStyle(color: const Color.fromARGB(255, 108, 108, 108)),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price: ${widget.totalPrice.toString()}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),

               ElevatedButton(
              onPressed: createBooking,
              child: Text("Book now"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background color
                onPrimary: Colors.white, // text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController text ,String label, String placeholder, {bool isCountry = false}) {
    return TextField(
      controller:text ,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        suffixIcon: isCountry ? Icon(Icons.arrow_drop_down) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}



class BookingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wish List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
 ],
        ),
      ),
    );
  }
}
class PreviousCartItem extends StatelessWidget {
  final String activityName;
  final String startingTime;
  final int totalPrice;

  const PreviousCartItem({
    Key? key,
    required this.activityName,
    required this.startingTime,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 198, 206, 206),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                color: Colors.grey, // Placeholder for image
                child: Icon(Icons.image, size: 50),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activityName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      startingTime,
                      style: TextStyle(color: Color.fromARGB(255, 50, 50, 50)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Total Price: $totalPrice',
                      style: TextStyle(color: Color.fromARGB(255, 50, 50, 50)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Handle checkout button press
            },
            child: Text('Checkout'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

