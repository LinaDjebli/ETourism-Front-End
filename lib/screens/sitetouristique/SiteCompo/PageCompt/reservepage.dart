import 'package:flutter/material.dart';


class ReservePage extends StatelessWidget {
  final String activityName;
  final String startingTime;
  final int totalPrice;

  ReservePage({
    required this.activityName,
    required this.startingTime,
    required this.totalPrice,
  });

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
            buildTextField('First name*', 'Maria'),
            SizedBox(height: 16),
            buildTextField('Last name*', 'Boukabous'),
            SizedBox(height: 16),
            buildTextField('Email address*', 'mariaboukabous709@gmail.com'),
            SizedBox(height: 16),
            buildTextField('Willaya*', 'Algeria', isCountry: true),
            SizedBox(height: 16),
            buildTextField('Mobile phone number*', '+213560866129'),
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
                  'Total Price: ${totalPrice.toString()}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
 ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder, {bool isCountry = false}) {
    return TextField(
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
