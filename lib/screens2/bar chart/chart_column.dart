import 'package:flutter/material.dart';
import 'package:tro/constants/Size.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartColumn extends StatelessWidget {
  const ChartColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      surfaceTintColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vertical Bar',
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
                        fontSize: 18, // Adjusted the font size
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, size: 40),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            Row(
              children: [
                Container(
                  width: 27,
                  height: 13,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 220, 233, 30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Data one',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14, // Adjusted the font size
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: defaultPadding),
                Container(
                  width: 27,
                  height: 13,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 79, 108, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Data two',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14, // Adjusted the font size
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            SfCartesianChart(
              plotAreaBackgroundColor: Colors.transparent,
              margin: const EdgeInsets.all(0),
              borderColor: Colors.transparent,
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: CategoryAxis(
                axisLine: const AxisLine(width: 0.5),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                crossesAt: 0,
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
                minimum: -1,
                maximum: 2,
                interval: 0.5,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  dataSource: charData,
                  width :0.5,
                  color : Colors.amber ,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y,
                ),
                           ColumnSeries<ChartColumnData, String>(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  dataSource: charData,
                  width :0.5,
                  color : Colors.blue ,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChartColumnData {
  ChartColumnData(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}

final List<ChartColumnData> charData = <ChartColumnData>[
  ChartColumnData('mo', -0.3, 1.7),
  ChartColumnData('tu', -0.5, 1.7),
  ChartColumnData('we', -0.4, 1.7),
  ChartColumnData('th', -0.45, 1.7),
  ChartColumnData('fr', -0.9, 1.7),
  ChartColumnData('sa', -0.6, 1.7),
   ChartColumnData('su', -0.6, 1.7),
];
