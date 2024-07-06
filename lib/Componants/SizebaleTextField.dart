import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:tro/Componants/textfiled.dart';

class SizebaleTextfield extends StatefulWidget {
  SizebaleTextfield({
    Key? key,
    required this.controller,
    required this.sizefield,
    required this.max,
    required this.hintText,
    required this.iconVisible,
    required this.iconOnPressed,
    required this.errortext,
    required this.eroorcond,
    required this.onChanged,
    //  required this.counter
  }) : super(key: key);

  final TextEditingController controller;
  final int sizefield;
  final int max;
  final String hintText;
  final bool iconVisible;
  final VoidCallback iconOnPressed;
  final String errortext;
  final bool eroorcond ; 
  final Function(String) onChanged; 
  //final int counter;

  @override
  State<SizebaleTextfield> createState() => _SizebaleTextfieldState();
}

class _SizebaleTextfieldState extends State<SizebaleTextfield> {
  int characterCount = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateCharacterCount);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharacterCount);
    super.dispose();
  }

  void _updateCharacterCount() {
    setState(() {
      characterCount = widget.controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            onChanged:widget.onChanged,
            maxLines: 10,
            autocorrect: true,
            cursorColor: Colors.black,
            controller: widget.controller,
            minLines: widget.sizefield,
            decoration: InputDecoration(
              errorText: widget.eroorcond?null : widget.errortext,
              suffixIcon: widget.iconVisible
                  ? IconButton(
                      onPressed: widget.iconOnPressed, icon: Icon(Icons.remove))
                  : null,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(108, 73, 72, 72),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(108, 132, 132, 132),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: widget.hintText,
              
            ),
          ),
          //SizedBox(height: 10),
          Text(
            '$characterCount / ${widget.max}',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: characterCount > widget.max
                  ? Colors.red
                  : Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
