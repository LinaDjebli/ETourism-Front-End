import 'package:flutter/material.dart';
import 'package:tro/Componants/SelectChip.dart';

import 'package:flutter/material.dart';
// Ensure this is the correct import path
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/network_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/widgets/hint_text.dart';
import 'package:multi_dropdown/widgets/selection_chip.dart';
import 'package:multi_dropdown/widgets/single_selected_item.dart';
import 'package:flutter/material.dart';
// Ensure this is the correct import path

class SelectButton extends StatefulWidget {
  final String buttonText;
  final List<ItemValue> listOfItems;
  final String textOfList;
  final double sizeofwidth;
  final String Text;
  
   // Updated

  SelectButton(
      {Key? key,
      required this.buttonText,
      required this.listOfItems,
      required this.textOfList,
      required this.sizeofwidth,
      required this.Text})
      : super(key: key);

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiSelectDropDownClass(
          sizewith: widget.sizeofwidth,
          Text: widget.Text,
          options: widget.listOfItems,
          onOptionSelected: (
            List<String> selectedOptions,
          ) {
            setState(() {
              selectedItems = selectedOptions;
            });
          },
          
          optionTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: selectedItems
              .map((item) => Chip(
                    backgroundColor: const Color.fromARGB(255, 232, 232, 232),
                    label: Text(item),
                    onDeleted: () {
                      setState(() {
                        selectedItems.remove(item);
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class ItemValue {
  final String label;
  final String value;

  const ItemValue({required this.label, required this.value});
}
class MultiSelectDropDownClass extends StatefulWidget {
  final List<ItemValue> options;
  final Function(List<String> selectedOptions) onOptionSelected;
  final double dropdownHeight;
  final TextStyle optionTextStyle;
  final Icon selectedOptionIcon;
  final bool isExpanded;
  final double sizewith;
  final String Text;

  const MultiSelectDropDownClass({
    Key? key,
    required this.options,
    required this.onOptionSelected,
    this.dropdownHeight = 150,
    this.optionTextStyle = const TextStyle(fontSize: 16),
    this.selectedOptionIcon = const Icon(Icons.check_circle),
    this.isExpanded = false,
    required this.sizewith,
    required this.Text,
  }) : super(key: key);

  @override
  _MultiSelectDropDownClassState createState() =>
      _MultiSelectDropDownClassState();
}

class _MultiSelectDropDownClassState extends State<MultiSelectDropDownClass> {
  List<String> selectedItems = [];
  bool isDropdownOpened = false;

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: widget.sizewith,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isDropdownOpened = !isDropdownOpened;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.Text),
                  Icon(
                    isDropdownOpened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isDropdownOpened)
          Container(
            width: widget.sizewith,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(12),
            height: widget.dropdownHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 221, 219, 219)),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [],
            ),
            child: Scrollbar(
              trackVisibility: true,
              interactive: true,
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.options.map((item) {
                    return CheckboxListTile(
                      title: Text(item.label, style: widget.optionTextStyle),
                      value: selectedItems.contains(item.label), // Check if item label is selected
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedItems.add(item.label); // Add item label to selectedItems
                          } else {
                            selectedItems.remove(item.label); // Remove item label from selectedItems
                          }
                          widget.onOptionSelected(selectedItems.toList()); // Pass selected labels
                        });
                      },
                      secondary: selectedItems.contains(item.label)
                          ? widget.selectedOptionIcon
                          : null,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        SizedBox(height: 10),
      ],
    );
  }
}