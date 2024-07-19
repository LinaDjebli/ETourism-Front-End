import 'package:flutter/material.dart';

class InfoagencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
 AppBar(title: Text('Wish List')),
  body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey, // Placeholder for image
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Interviajes NY',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'This activity provider is a trader\n on the GetYourGuide marketplace',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Legal notice',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 20),
              buildInfoRow('Legal company name', 'Interviajes NY LLC'),
              buildInfoRow('Registered address', '90 Columbia Ave\n07010 Cliffside Park\nNJ'),
              buildInfoRow('Managing director(s)', 'Marco Garcia'),
              SizedBox(height: 20),
              Text(
                'Contact information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'For questions about meeting or pickup point, activity details, or special requests, contact your activity provider.',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContactButton(
                    icon: Icons.phone,
                    label: 'Call your activity provider',
                    onPressed: () {
                      // Handle call action
                    },
                  ),
                  ContactButton(
                    icon: Icons.email,
                    label: 'Message your activity provider',
                    onPressed: () {
                      // Handle message action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(info),
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ContactButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: Color.fromARGB(255, 230, 247, 247),
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height:10),
          Text(
            label,
            style: TextStyle(color: Color.fromARGB(255, 33, 177, 243)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}