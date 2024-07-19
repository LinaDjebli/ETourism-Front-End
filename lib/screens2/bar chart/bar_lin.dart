import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tro/constants/Size.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      surfaceTintColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Line Chart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Statistics of the month',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: defaultPadding * 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 220, 233, 30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Text(
                      'Total Revenue\n\n (in million)\n 200DA',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
 Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 79, 108, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Text(
                      'Total Revenue\n\n (in million)\n 200DA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: defaultPadding*3),
            AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: const Color.fromARGB(148, 85, 85, 85),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: const Color.fromARGB(148, 85, 85, 85),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Mo');
                            case 1:
                              return const Text('Tu');
                            case 2:
                              return const Text('We');
                            case 3:
                              return const Text('Th');
                            case 4:
                              return const Text('Fr');
                            case 5:
                              return const Text('Sa');
                            case 6:
                              return const Text('Su');
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color.fromARGB(94, 119, 118, 118),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 6,
                  minY: -1,
                  maxY: 2,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, -0.3),
                        FlSpot(1, -0.5),
                        FlSpot(2, -0.4),
                        FlSpot(3, -0.45),
                        FlSpot(4, -0.9),
                        FlSpot(5, -0.6),
                        FlSpot(6, -0.6),
                      ],
                      isCurved: true,
                      color: const Color.fromARGB(157, 198, 24, 24),
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.transparent,
                      ),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 1.7),
                        FlSpot(1, 1.9),
                        FlSpot(2, 1.7),
                        FlSpot(3, 1.7),
                        FlSpot(4, 1.7),
                        FlSpot(5, 1.7),
                        FlSpot(6, 1.8),
                      ],
                      isCurved: true,
                      color: const Color.fromARGB(255, 255, 193, 7),
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color.fromARGB(76, 43, 121, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




