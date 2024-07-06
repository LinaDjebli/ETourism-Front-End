import 'dart:io';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:flutter/material.dart';

class Guide {
   final String username ;
  final String guideEmail;
  final String guidePhoneNumber;
  final String password;
  final String guideFirstName;
  final String guideLastName;
  final String guideWebsite;
  final String guideLocation;
  final String guidedateofbirth;
  final File? guideLicenses;
  final File? guideProfilePicture;
 final List<String> guideLanguages;
  
  final String gender ;
  final String guidedescription;

  Guide({
    required this.username,
    required this.guideEmail,
    required this.guidePhoneNumber,
    required this.password,
    required this.guideFirstName,
    required this.guideLastName,
    required this.guideWebsite,
    required this.guideLocation,
    required this.guidedateofbirth,
    this.guideLicenses,
    this.guideProfilePicture,
    required this.guideLanguages,
     
    required this.gender,
    required this.guidedescription
  });

  Map<dynamic, dynamic> toJson() {
     Map<dynamic,dynamic> json =  {
      'username':username,
      'guide_email': guideEmail,
      'guide_phone_number': guidePhoneNumber,
      'password': password,
      'guide_first_name': guideFirstName,
      'guide_last_name': guideLastName,
      'guide_website': guideWebsite,
      'guide_dateofbirth':guidedateofbirth,
      'guide_location': guideLocation,
      'guide_licenses': guideLicenses,
      'guide_profile_picture': guideProfilePicture,
      'guide_gender':gender,
      'guide_description':guidedescription,
      
    };
     for (String language in guideLanguages) {
      json['guide_languages'] = language;
    }

    if (guideLicenses != null) {
   
    json['guide_licenses'] = guideLicenses;
  }

  if (guideProfilePicture != null) {
    
    json['guide_profile_picture'] = guideProfilePicture;
  }
   
    return json; 
  }


  Future<void> sendGuideData(Guide guide) async {
  final url = Uri.parse('http://192.168.100.53:8000/api/signup/guide/');
  final request = http.MultipartRequest('POST', url);

  final guideJson = guide.toJson();
  guideJson.forEach((key, value) {
    request.fields[key] = value.toString();
  });

  // Add guide_languages fields separately
  for (String language in guide.guideLanguages) {
    request.fields['guide_languages'] = language;
  }

  // Add files if they exist
  if (guide.guideLicenses != null) {
    request.files.add(await http.MultipartFile.fromPath(
      'guide_licenses',
      guide.guideLicenses!.path,
      filename: basename(guide.guideLicenses!.path),
    ));
  }

  if (guide.guideProfilePicture != null) {
    request.files.add(await http.MultipartFile.fromPath(
      'guide_profile_picture',
      guide.guideProfilePicture!.path,
      filename: basename(guide.guideProfilePicture!.path),
    ));
  }

  final response = await request.send();
  if (response.statusCode == 200) {
    print('Data sent successfully');
  } else {
    print('Failed to send data');
  }
}
}
