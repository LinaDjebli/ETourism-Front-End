import 'package:flutter/material.dart';
import 'package:tro/constants/Size.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> _labels = {
      'Document': Colors.black,
      'Picture': Colors.blue,
      'Video': Colors.green,
      'Audio': Colors.orange,
    };

    return Card(
      color: secondaryColor,
      surfaceTintColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: SfRadialGauge(
                      axes: [
                        RadialAxis(
                          labelOffset: 0,
                          pointers: const [
                            RangePointer(
                              value: 20,
                              cornerStyle: CornerStyle.bothCurve,
                              color: Colors.blue,
                              width: 30,
                            )
                          ],
                          axisLineStyle: const AxisLineStyle(
                            thickness: 30,
                          ),
                          startAngle: 130,
                          endAngle: 50, // Corrected endAngle
                          showLabels: false,
                          showTicks: false,
                          annotations: const [
                            GaugeAnnotation(
                              widget: Text(
                                '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Colors.amber,
                                ),
                              ),
                              positionFactor: 0.2,
                            )
                          ],
                        ),
                        RadialAxis(
                          pointers: const [
                            RangePointer(
                              value: 20,
                              cornerStyle: CornerStyle.bothCurve,
                              color: Colors.blue,
                              width: 30,
                            )
                          ],
                          startAngle: 10,
                          endAngle: 80, // Corrected endAngle
                          showLabels: false,
                          showTicks: false,
                        ),
                        RadialAxis(
                          pointers: const [
                            RangePointer(
                              value: 20,
                              cornerStyle: CornerStyle.bothCurve,
                              color: Color.fromARGB(255, 33, 243, 51),
                              width: 30,
                            )
                          ],
                          startAngle: 90,
                          endAngle: 170, // Corrected endAngle
                          showLabels: false,
                          showTicks: false,
                        ),
                        RadialAxis(
                          pointers: const [
                            RangePointer(
                              value: 20,
                              cornerStyle: CornerStyle.bothCurve,
                              color: Color.fromARGB(255, 243, 103, 33),
                              width: 30,
                            )
                          ],
                          startAngle: 40,
                          endAngle: 120, // Corrected endAngle
                          showLabels: false,
                          showTicks: false,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: defaultPadding * 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _labels.entries
                      .map((entry) => LabelChart(entry.key, entry.value))
                      .toList(),
                )
              ],
            ),
            SizedBox(height: defaultPadding,),
            Text('Storage of your device', style: TextStyle(
              fontSize: 22 ,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: defaultPadding,),
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('data', style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                  
                ],)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget LabelChart(String label, Color color) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}

