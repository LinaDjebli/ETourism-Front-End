import 'package:flutter/material.dart';

class TextandField extends StatefulWidget {
  TextandField(
      {super.key,
      required this.tooltipText,
      required this.Text,
      required this.TextSize});
  String tooltipText;
  String Text;
  double TextSize;
  @override
  State<TextandField> createState() => _TextandFieldState();
}

class _TextandFieldState extends State<TextandField> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    widget.Text,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 14, 64, 122),
                      fontSize: widget.TextSize,
                      fontWeight: FontWeight.bold,
                      //font fam to add later
                    ),

                    softWrap: true, // Allows the text to wrap to the next line
                  ),
                  Tooltip(
                    padding: EdgeInsets.all(20),
                    message: widget.tooltipText,
                    child: Icon(
                      Icons.info_outline,
                      color: const Color.fromARGB(255, 27, 124, 235),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
