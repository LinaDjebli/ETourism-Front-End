import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:tro/Create%20Activity/ActivityPagenine.dart';

class WeeklyActivity {
  int category;
  String type;
  String title;
  String description;
  List<String> highlights;
  String destination;
  List<Map<String, String>> includes;
  List<Map<String, String>> notIncludes;
  List<String> activityStaff;
  List<Map<String, String>> food;
  List<Map<String, String>> transport;
  List<Map<String, String>> suitableFor;
  List<Map<String, String>> notAllowed;
  List<String> itemsToBring;
  String phoneNumber;
  
  int maxGroup;
  String meetingPoint;
  String arrival;
  String dropOff;
  int? publisher;
   List<Map<String, dynamic>>  prices;
   List<String> days ; 
   String start_hour;
   String end_hour;
  String region;
  String wilaya;
  String cutofftime;

  WeeklyActivity({
    required this.category,
    required this.type,
    required this.title,
    required this.description,
    required this.highlights,
    required this.destination,
    required this.includes,
    required this.notIncludes,
    required this.activityStaff,
    required this.food,
    required this.transport,
    required this.suitableFor,
    required this.notAllowed,
    required this.itemsToBring,
    required this.phoneNumber,
      required this.days,
      required this.start_hour,
      required this.end_hour,
    required this.maxGroup,
    required this.meetingPoint,
    required this.arrival,
    required this.dropOff,
    required this.publisher,
      required this.prices,
   
    required this.region,
    required this.wilaya,
    required this.cutofftime,
  });

 factory WeeklyActivity.fromJson(Map<String, dynamic> json) {
  return WeeklyActivity(
    category: json['activity']['activity_category'],
    type: json['activity']['activity_type'],
    title: json['activity']['activity_name'],
    description: json['activity']['activity_description'],
    highlights: List<String>.from(json['activity']['highlights'].map((item) => item['description'])),
    destination: json['activity']['activity_location'],
    includes: List<Map<String, String>>.from(json['activity']['includes'].map((item) => {"description": item['description']})),
    notIncludes: List<Map<String, String>>.from(json['activity']['not_includes'].map((item) => {"description": item['description']})),
    activityStaff: [json['activity']['guide_name']],
    food: List<Map<String, String>>.from(json['activity']['food'].map((item) => {"food": item['food']})),
    transport: List<Map<String, String>>.from(json['activity']['transport'].map((item) => {"transport": item['transport']})),
    suitableFor: List<Map<String, String>>.from(json['activity']['suitable_for'].map((item) => {"description": item['description']})),
    notAllowed: List<Map<String, String>>.from(json['activity']['not_allowed'].map((item) => {"description": item['description']})),
    itemsToBring: List<String>.from(json['activity']['items_to_bring'].map((item) => item['description'])), // Adjusted based on possible data structure
    phoneNumber: json['activity']['emergency_phone_number'],
    maxGroup: json['activity']['group_size'],
    meetingPoint: json['activity']['meeting_point'],
    arrival: json['activity']['arrival'], // Assuming this is a typo fix, as it was mentioned as 'cut_off_time'
    dropOff: json['activity']['drop_off'],
    publisher: json['activity']['published_by'],
    prices: List<Map<String, dynamic>>.from(json['activity']['prices'].map((item) => item)),
    days: List<String>.from(json['days']),
    start_hour: json['start_hour'],
    end_hour: json['end_hour'],
    region: json['activity']['region'],
    wilaya: json['activity']['wilaya'],
    cutofftime: json['activity']['cut_off_time'],
  );

    
  }
  Map<String, dynamic> toJson() {
    return {
     "activity": {
       "activity_name": title,
      "guide_name": activityStaff.isNotEmpty ? activityStaff[0] : '',
      "activity_category": category,
      "activity_type": type,
      "activity_description": description,
      "activity_location": destination,
      "emergency_phone_number": phoneNumber,
      "cut_off_time": cutofftime,
      "meeting_point": meetingPoint,
      "groupesize": maxGroup,
      "dropoff": dropOff,
      "prices":  prices,
      "notsuitable_for": suitableFor.map((item) => {"description": item['description']}).toList(),
      "not_allowed": notAllowed.map((item) => {"description": item['description']}).toList(),
      "includes": includes.map((item) => {"description": item['description']}).toList(),
      "not_includes": notIncludes.map((item) => {"description": item['description']}).toList(),
      "highlights": highlights.map((highlight) => {'description': highlight}).toList(),
      "food": food.map((item) => {"food": item['food']}).toList(),
      "transport": transport.map((item) => {"transport": item['transport']}).toList(),
      "published_by": publisher,
       "region": region,
      "wilaya": wilaya,
     },
        "day": days , 
        "start_hour" : start_hour,
        "end_hour" : end_hour
     
    
  };
     
 
}
}

class  DailyActivty {
  int? category;
  String type;
  String title;
  String description;
  List<String> highlights;
  String destination;
  List<Map<String, String>> includes;
  List<Map<String, String>> notIncludes;
  List<String> activityStaff;
  List<Map<String, String>> food;
  List<Map<String, String>> transport;
  List<Map<String, String>> suitableFor;
  List<Map<String, String>> notAllowed;
  List<String> itemsToBring;
  String phoneNumber;
  
  int? maxGroup;
  String meetingPoint;
  String arrival;
  String dropOff;
  int? publisher;
   List<Map<String, dynamic>>?  prices;
   String starthour;
   String endhour;
  String region;
  String wilaya;
  String cutofftime;

  
  // Constructor
  DailyActivty({
     this.category,
    required this.type,
    required this.title,
    required this.description,
    required this.highlights,
    required this.destination,
    required this.includes,
    required this.notIncludes,
    required this.activityStaff,
    required this.food,
    required this.transport,
    required this.suitableFor,
    required this.notAllowed,
    required this.itemsToBring,
    required this.phoneNumber,
    this.maxGroup,
    required this.meetingPoint,
    required this.arrival,
    required this.dropOff,
  this.publisher,
     this.prices,
    required this.starthour,
    required this.endhour,
    required this.region,
    required this.wilaya,
    required this.cutofftime,
  });
   

  factory DailyActivty.fromJson(Map<String, dynamic> json) {
    var activityJson = json['activity'];

    return DailyActivty(
    //  category: int.parse(activityJson['activity_category']),
      type: activityJson['activity_type'],
      title: activityJson['activity_name'],
      description: activityJson['activity_description'],
      highlights: List<String>.from(activityJson['highlights'].map((item) => item['description'])),
      destination: activityJson['activity_location'],
      includes: List<Map<String, String>>.from(activityJson['includes'].map((item) => {"description": item['description']})),
      notIncludes: List<Map<String, String>>.from(activityJson['not_includes'].map((item) => {"description": item['description']})),
      activityStaff: [activityJson['guide_name']],
      food: List<Map<String, String>>.from(activityJson['food'].map((item) => {"food": item['food']})),
      transport: List<Map<String, String>>.from(activityJson['transport'].map((item) => {"transport": item['transport']})),
      suitableFor: List<Map<String, String>>.from(activityJson['notsuitable_for'].map((item) => {"description": item['description']})),
      notAllowed: List<Map<String, String>>.from(activityJson['not_allowed'].map((item) => {"description": item['description']})),
      itemsToBring: List<String>.from(activityJson['items_to_bring'].map((item) => item['description'])),
      phoneNumber: activityJson['emergency_phone_number'],
     // maxGroup: int.parse(activityJson['groupesize']),
      meetingPoint: activityJson['meeting_point'],
      arrival: activityJson['arrival'],
      dropOff: activityJson['dropoff'],
     // publisher: int.parse(activityJson['published_by']),
     // prices: List<Map<String, dynamic>>.from(activityJson['prices'].map((item) => item)),
      starthour: json['start_hour'],
      endhour: json['end_hour'],
      region: activityJson['region'],
      wilaya: activityJson['wilaya'],
      cutofftime: activityJson['cut_off_time'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
     "activity": {
       "activity_name": title,
      "guide_name": activityStaff.isNotEmpty ? activityStaff[0] : '',
      "activity_category": category,
      "activity_type": type,
      "activity_description": description,
      "activity_location": destination,
      "emergency_phone_number": phoneNumber,
      "cut_off_time": cutofftime,
      "meeting_point": meetingPoint,
      "groupesize": maxGroup,
      "dropoff": dropOff,
      "prices":  prices,
      "notsuitable_for": suitableFor.map((item) => {"description": item['description']}).toList(),
      "not_allowed": notAllowed.map((item) => {"description": item['description']}).toList(),
      "includes": includes.map((item) => {"description": item['description']}).toList(),
      "not_includes": notIncludes.map((item) => {"description": item['description']}).toList(),
      "highlights": highlights.map((highlight) => {'description': highlight}).toList(),
      "food": food.map((item) => {"food": item['food']}).toList(),
      "transport": transport.map((item) => {"transport": item['transport']}).toList(),
      "published_by": publisher,
       "region": region,
      "wilaya": wilaya,
     },
        "start_hour": starthour , 
        "end_hour" :  endhour,
     
    
  };}
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

  Map<String, dynamic> toJson() {
    return {
      'price_type': priceType,
      'number_of_clients': numberOfClients,
      'price': price,
    };
  }
}

class OneDayActivity {
 int category;
  String type;
  String title;
  String description;
  List<String> highlights;
  String destination;
  List<Map<String, String>> includes;
  List<Map<String, String>> notIncludes;
  List<String> activityStaff;
  List<Map<String, String>> food;
  List<Map<String, String>> transport;
  List<Map<String, String>> suitableFor;
  List<Map<String, String>> notAllowed;
  List<String> itemsToBring;
  String phoneNumber;
  
  int maxGroup;
  String meetingPoint;
  String arrival;
  String dropOff;
  int? publisher;
   List<Map<String, dynamic>>  prices;
   String starthour;
   String endhour;
  String region;
  String wilaya;
  String cutofftime;
  String date;
   
  
  // Constructor
  OneDayActivity({
   required this.category,
    required this.type,
    required this.title,
    required this.description,
    required this.highlights,
    required this.destination,
    required this.includes,
    required this.notIncludes,
    required this.activityStaff,
    required this.food,
    required this.transport,
    required this.suitableFor,
    required this.notAllowed,
    required this.itemsToBring,
    required this.phoneNumber,
    required this.maxGroup,
    required this.meetingPoint,
    required this.arrival,
    required this.dropOff,
    required this.publisher,
    required this.prices,
    required this.starthour,
    required this.endhour,
    required this.region,
    required this.wilaya,
    required this.cutofftime,
    required this.date,
   
  });
  Map<String, dynamic> toJson() {
    return {
     "activity": {
       "activity_name": title,
      "guide_name": activityStaff.isNotEmpty ? activityStaff[0] : '',
      "activity_category": category,
      "activity_type": type,
      "activity_description": description,
      "activity_location": destination,
      "emergency_phone_number": phoneNumber,
      "cut_off_time": cutofftime,
      "meeting_point": meetingPoint,
      "groupesize": maxGroup,
      "dropoff": dropOff,
      "prices":  prices,
      "notsuitable_for": suitableFor.map((item) => {"description": item['description']}).toList(),
      "not_allowed": notAllowed.map((item) => {"description": item['description']}).toList(),
      "includes": includes.map((item) => {"description": item['description']}).toList(),
      "not_includes": notIncludes.map((item) => {"description": item['description']}).toList(),
      "highlights": highlights.map((highlight) => {'description': highlight}).toList(),
      "food": food.map((item) => {"food": item['food']}).toList(),
      "transport": transport.map((item) => {"transport": item['transport']}).toList(),
      "published_by": publisher,
       "region": region,
      "wilaya": wilaya,
     },
        "activity_date": date , 
        "start_hour" : starthour,
        "end_hour" : endhour
     
    
  };}
}
class SpecificDurationActivity {
  int category;
  String type;
  String title;
  String description;
  List<String> highlights;
  String destination;
  List<Map<String, String>> includes;
  List<Map<String, String>> notIncludes;
  List<String> activityStaff;
  List<Map<String, String>> food;
  List<Map<String, String>> transport;
  List<Map<String, String>> suitableFor;
  List<Map<String, String>> notAllowed;
  List<String> itemsToBring;
  String phoneNumber;
  
  int maxGroup;
  String meetingPoint;
  String arrival;
  String dropOff;
  int? publisher;
   List<Map<String, dynamic>>  prices;
 
   String starthour;
   String endhour;
  String region;
  String wilaya;
  String cutofftime;
  String startDate;
  String endDate;
  
  // Constructor
  SpecificDurationActivity({
  required this.category,
    required this.type,
    required this.title,
    required this.description,
    required this.highlights,
    required this.destination,
    required this.includes,
    required this.notIncludes,
    required this.activityStaff,
    required this.food,
    required this.transport,
    required this.suitableFor,
    required this.notAllowed,
    required this.itemsToBring,
    required this.phoneNumber,
    required this.maxGroup,
    required this.meetingPoint,
    required this.arrival,
    required this.dropOff,
    required this.publisher,
    required this.prices,
    required this.starthour,
    required this.endhour,
    required this.region,
    required this.wilaya,
    required this.cutofftime,
    required this.startDate,
    required this.endDate,
    
  });
  Map<String, dynamic> toJson() {
    return {
     "activity": {
       "activity_name": title,
      "guide_name": activityStaff.isNotEmpty ? activityStaff[0] : '',
      "activity_category": category,
      "activity_type": type,
      "activity_description": description,
      "activity_location": destination,
      "emergency_phone_number": phoneNumber,
      "cut_off_time": cutofftime,
      "meeting_point": meetingPoint,
      "groupesize": maxGroup,
      "dropoff": dropOff,
      "prices":  prices,
      "notsuitable_for": suitableFor.map((item) => {"description": item['description']}).toList(),
      "not_allowed": notAllowed.map((item) => {"description": item['description']}).toList(),
      "includes": includes.map((item) => {"description": item['description']}).toList(),
      "not_includes": notIncludes.map((item) => {"description": item['description']}).toList(),
      "highlights": highlights.map((highlight) => {'description': highlight}).toList(),
      "food": food.map((item) => {"food": item['food']}).toList(),
      "transport": transport.map((item) => {"transport": item['transport']}).toList(),
      "published_by": publisher,
       "region": region,
      "wilaya": wilaya,
     },
        "activity_start_date":  startDate , 
        "activity_end_date" :  endDate,
        "start_hour" :  starthour,
        "end_hour" : endhour
     
    
  };}
}
