import 'package:flutter/material.dart';

class SvgPicture extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? width;
  
  const SvgPicture({
    Key? key,
    required this.assetName,
    this.color,
    this.width,
  }) : super(key: key);

  static Widget asset(String assetName, {Color? color, double? width}) {
    return Image.asset(
      assetName,
      color: color,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      color: color,
      width: width,
    );
  }
}



