import 'package:flutter/material.dart';
import 'package:tro/Create%20Activity/ActivityCategory.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Activity Creation Introduction",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Activity Creation",
              style: TextStyle(
                color: Colors.blue.shade800,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

             Center(
                child: Image.asset(
                  'lib/photos/info.png', // Update with your image path
                  height: 200,
                ),
              ),
            SizedBox(height: 20),
            Row(
              children: [
                  Icon(
                  Icons.info_outline,
                  color: Colors.blue.shade800,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Take your time filling in the details. The more detailed and accurate the information, the better the experience for your customers.",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                 Icon(
                  Icons.info_outline,
                  color: Colors.blue.shade800,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Click on the exclamation marks (!) for more information on what to fill in each field.",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.blue.shade800,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "The activity creation process might take around 30 minutes. Make sure you have all the necessary information ready.",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityCategory()));
                },
                child: Text("Start Creating Activity"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                  onPrimary: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
