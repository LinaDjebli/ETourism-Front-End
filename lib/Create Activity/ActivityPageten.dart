
import 'package:flutter/material.dart';
  import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tro/globals.dart';
class Booking {
  final String firstname;
  final String lastname;
  final String email;
  final int age;
  final String wilaya;
  final String phonenumber;
  final int numberOfTickets;
  final double totalPrice;
  final String activity;
  final String bookingDate;
  final String state;

  Booking({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.age,
    required this.wilaya,
    required this.phonenumber,
    required this.numberOfTickets,
    required this.totalPrice,
    required this.activity,
    required this.bookingDate,
    required this.state,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      age: json['age'],
      wilaya: json['wilaya'],
      phonenumber: json['phonenumber'],
      numberOfTickets: json['number_of_tickets'],
      totalPrice: json['total_price'] is String
          ? double.tryParse(json['total_price']) ?? 0.0
          : (json['total_price'] as num).toDouble(),
      activity: json['activity'].toString(),  // Ensure activity is a string
      bookingDate: json['booking_date'],
      state: json['state'],
    );
  }
}


class BookingListScreen extends StatefulWidget {

  BookingListScreen({super.key});

  @override
  _BookingListScreenState createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  late Future<List<Booking>> _futureBookings;
int? convertUserIdToInt(String? userId) {
  if (userId == null) {
    print('Error: The user ID is null.');
    // Handle the error as needed
    return null; // or return a default value like 0
  }

  // Attempt to parse the userId as an integer
  final int? userIdInt = int.tryParse(userId);
  
  if (userIdInt == null) {
    print('Error: The user ID is not a valid integer.');
    // Handle the error as needed
    return null; // or return a default value like 0
  }

  return userIdInt;
}

  @override
  void initState() {
    super.initState();
    _futureBookings = fetchBookings(convertUserIdToInt(globalUserId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: FutureBuilder<List<Booking>>(
        future: _futureBookings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No bookings found'));
          } else {
            final bookings = snapshot.data!;
            return ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return ListTile(
                  title: Text('${booking.firstname} ${booking.lastname}'),
                  subtitle: Text('Activity: ${booking.activity}\nState: ${booking.state}'),
                  trailing: Text('Price: \$${booking.totalPrice.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<List<Booking>> fetchBookings(int? publisherId) async {
  final response = await http.get(Uri.parse('http://192.168.100.53:8000/api/api/bookings/publisher/$publisherId/'));
    print(publisherId);
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    print(data); // Add this line to check the API response
    return data.map((json) => Booking.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load bookings');
  }
}



