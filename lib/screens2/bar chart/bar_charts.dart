import 'package:flutter/material.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/screens2/bar%20chart/bar_lin.dart';
import 'package:tro/screens2/bar%20chart/chart_column.dart';
import 'circular_chart.dart';

class BarCharts extends StatelessWidget {
  const BarCharts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the desired height here
        child: AppBar(
         
          flexibleSpace: Padding(
            padding: EdgeInsets.only(bottom: 20.0 ,left: 16,right: 10), // Adjust padding as needed
            child: Align(
              alignment: Alignment.bottomCenter, // Align contents at the bottom
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25, // Adjust the radius as needed
                          backgroundImage: AssetImage('assets/caption.jpg'), // Provide your photo profile image asset
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min, // Minimize the height of the column
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello', // Replace with the user's name
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16, fontWeight:FontWeight.bold), // Adjust the font size as needed
                            ),
                            Text(
                              'Lyna03', // Replace with the user's role
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20 , fontWeight:FontWeight.w900), // Adjust the font size as needed
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                    child: IconButton(
                      onPressed: () {
                        // Add your icon's onPressed action here
                      },
                      icon: Icon(Icons.notifications), // Replace with your desired icon
                      iconSize: 30, // Adjust icon size as needed
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true, // Center the title horizontally
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              LineChartWidget(),
              SizedBox(height: defaultPadding),
                            ChartColumn(),
              SizedBox(height: defaultPadding),
              CircularChart(),
              SizedBox(height: defaultPadding*3),


            ],
          ),
        ),
      ),
    );
  }
}

