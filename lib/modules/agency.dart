import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class Agency {
  final String username ;
  final String agencyName;
  final String agencyEmail;
  final String password;
   final String password2;
  final String agencyPhoneNumber;
  final String agencyWebsite;
  final int numberOfEmployees;
  final String agencyLocation;
 final File? agencyLicenses;
  final File? agencyProfilePicture;

  Agency({
    required this.username,
    required this.agencyName,
    required this.agencyEmail,
    required this.password,
    required this.password2,
    required this.agencyPhoneNumber,
    required this.agencyWebsite,
    required this.numberOfEmployees,
    required this.agencyLocation,
    this.agencyLicenses,
    this.agencyProfilePicture,
  });

 Map<String, dynamic> toJson() {
  Map<String, dynamic> json = {
    'username': username,
    'agency_name': agencyName,
    'agency_email': agencyEmail,
    'password': password,
    'password2': password2 ,
    'agency_phone_number': agencyPhoneNumber,
    'agency_website': agencyWebsite,
    'number_of_employees': numberOfEmployees,
    'agency_location': agencyLocation,
  };

  if (agencyLicenses != null) {
   
    json['agency_licenses'] = agencyLicenses;
  }

  if (agencyProfilePicture != null) {
    
    json['agency_profile_picture'] = agencyProfilePicture;
  }

  return json;
}
}

// guide.dart
