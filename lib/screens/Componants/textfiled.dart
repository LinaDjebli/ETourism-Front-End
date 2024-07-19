import 'package:flutter/material.dart';

class textfiled extends StatefulWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscuretext;
  final String errortext ;
  final bool error ;
  
  var method; 
  

  textfiled({
    Key? key,
    required this.controller,
    required this.hintext,
    required this.obscuretext,
    required this.errortext,
    required this.error,
    required this.method
  }) : super(key: key);

  @override
  _textfiledState createState() => _textfiledState();
}

class _textfiledState extends State<textfiled> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscuretext,
        onTap: () {
          setState(() {
            isFocused =!isFocused;
          });
        },
        decoration: InputDecoration(
          hintText: widget.hintext,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isFocused ? Colors.black : Color.fromARGB(255, 184, 184, 184),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          filled: true,
          errorText:widget.error ? null : widget.errortext,
          
        ),
        onChanged : widget.method
      ),
    );
  }
}

