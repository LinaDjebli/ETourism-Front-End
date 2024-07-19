import 'package:flutter/material.dart';
import 'package:tro/modules/activity.dart';
import 'package:tro/services/Authservice.dart';
 class Activity {
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

  Activity({
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

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
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


class DailyActivityPage extends StatefulWidget {
  @override
  _DailyActivityPageState createState() => _DailyActivityPageState();
}

class _DailyActivityPageState extends State<DailyActivityPage> {
  late Future<List<Activity>?> futureActivities;

  @override
  void initState() {
    super.initState();
    futureActivities = ApiService().fetchDailyActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Activities'),
      ),
      body: FutureBuilder<List<Activity>?>(
        future: futureActivities,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No activities found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Activity activity = snapshot.data![index];
                return ListTile(
                  title: Text(activity.activityName),
                  subtitle: Text(activity.activityDescription),
                  onTap: () {
                    // Handle tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
