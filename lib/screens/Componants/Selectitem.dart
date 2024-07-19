import 'package:flutter/material.dart';

class SelectItem extends StatefulWidget {
  SelectItem({super.key, required this.imagpath, required this.Text});
  String imagpath;
  String Text;
  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue // Change color when selected
                : Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isSelected
                    ? Colors.blue
                    : const Color.fromARGB(
                        255, 19, 83, 135), // Change border color when selected
                width: 2), // Increase border width when selected
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // shadow direction: bottom
              ),
              BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, -2), // shadow direction: top
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    widget.imagpath,
                    height: 60,
                  )),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.Text,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
