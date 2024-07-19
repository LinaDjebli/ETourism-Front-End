import 'dart:convert';
 
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tro/Create%20Activity/fetchdata.dart';
import 'package:tro/modules/activity.dart';
import 'package:tro/modules/client.dart';
import 'package:tro/modules/agency.dart';
import 'package:tro/modules/guide.dart';
import 'package:tro/constants/Size.dart';  
import 'package:dio/dio.dart';
import 'package:tro/navigateur.dart';    // Import your constants file

class ApiService {
    
   final String baseUrl = 'http://192.168.100.53:8000/api';
  Future<http.Response> registerClient(Client client) async {
     var response = await http.post(
      Uri.parse('$baseUrl/signup/client/'),
      headers: {'Content-Type': 'application/json'},
      body: 
      jsonEncode(client.toJson()),
    );
    if (response.statusCode == 201) {
      
    } else {
      // Handle error
      
   Map<String, dynamic> responseData = jsonDecode(response.body);
      print('Error: ${response.statusCode}');
      print('Body: ${response.body}');
    }
     return response ;
  }


   Future<http.Response> authenticateUser(String email, String password) async {
    var response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    print('Response status code: ${response.statusCode}');
    return response;
  }


Future<Response?> registerAgency(Agency agency) async {
  final String url = 'http://192.168.100.53:8000/api/signup/agency/';
  Dio dio = Dio();

  FormData formData = FormData.fromMap({
    ...agency.toJson(),
    'agency_licenses': agency.agencyLicenses != null
        ? await MultipartFile.fromFile(
            agency.agencyLicenses!.path,
            filename: agency.agencyLicenses!.path.split('/').last,
          )
        : null,
    'agency_profile_picture': agency.agencyProfilePicture != null
        ? await MultipartFile.fromFile(
            agency.agencyProfilePicture!.path,
            filename: agency.agencyProfilePicture!.path.split('/').last,
          )
        : null,
  });
   var response = await dio.post(url, data: formData);
  try {
   
    if (response.statusCode == 201) {
      print('Registration request submitted.');
      print(response.headers);
    } else {
      print('Registration failed with status: ${response.statusCode}.');
      print('Body: ${response.data}'); // Print the response body to see the detailed error
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print('DioError: ${e.response!.statusCode} - ${e.response!.data}');
    } else {
      print('DioError: ${e.message}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return response ; 
}

  Future<Response?> registerGuide(Guide guide ,  ) async {
    final String url = 'http://192.168.100.53:8000/api/signup/guide/';
     Dio dio = Dio();
 
  FormData formData = FormData.fromMap({
    ... guide.toJson(),
    'guide_licenses':  guide.guideLicenses != null
        ? await MultipartFile.fromFile(
             guide.guideLicenses!.path,
            filename:  guide.guideLicenses!.path.split('/').last,
          )
        : null,
    'guide_profile_picture':  guide.guideProfilePicture != null
        ? await MultipartFile.fromFile(
            guide.guideProfilePicture!.path,
            filename: guide.guideProfilePicture!.path.split('/').last,
          )
        : null,
  });
   

  // Add text fields to request

   var response = await dio.post(url, data: formData);
  try {
   
    if (response.statusCode == 201) {
      
      print('Registration request submitted.');
      print(response.headers);
      return response ; 
       
    } else {
      print('Registration failed with status: ${response.statusCode}.');
      print('Body: ${response.data}'); 
      return response ; // Print the response body to see the detailed error
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print('DioError: ${e.response!.statusCode} - ${e.response!.data}');
    } else {
      print('DioError: ${e.message}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return response;
  
}

 
Future<List<Activity>?> fetchDailyActivities() async {
 final String baseUrl = 'http://192.168.100.53:8000/api/api/dailyactivities/';
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<Activity> activities = body.map((dynamic item) => Activity.fromJson(item)).toList();
    return activities;
  } else {
    throw Exception('Failed to load activities: ${response.statusCode}');
  }
}





}