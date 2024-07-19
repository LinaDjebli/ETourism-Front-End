import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';

class HorizontalTimeline extends StatefulWidget {
  HorizontalTimeline({super.key, required this.index});
  int index;

  @override
  State<HorizontalTimeline> createState() => _HorizontalTimelineState();
}

class _HorizontalTimelineState extends State<HorizontalTimeline> {
  final List<String> _processes = [
    'Step 1',
    'Step 2',
    'Step 3',
    'Step 4',
    "Step5",
    'Step 6',
    "Step7 ",
  ];

  late int _processIndex;

  void initState() {
    super.initState();
    _processIndex = widget.index; // Initialize _processIndex in initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.topCenter,
      child: Timeline.tileBuilder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(space: 8.0, thickness: 2.0),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: _processes.length,
          itemExtentBuilder: (_, __) {
            return (MediaQuery.of(context).size.width - 60) / _processes.length;
          },
          oppositeContentsBuilder: (context, index) {},
          contentsBuilder: (context, index) {
            return Container();
          },
          indicatorBuilder: (_, index) {
            if (index <= _processIndex) {
              return DotIndicator(
                size: 20.0,
                color: Colors.blue.shade900,
              );
            } else {
              return OutlinedDotIndicator(
                borderWidth: 4.0,
                color: Colors.blue.shade900,
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              return SolidLineConnector(
                color: Colors.blue.shade900,
              );
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
