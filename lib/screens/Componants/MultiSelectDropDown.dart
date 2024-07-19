import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MultiSelectDropDownComponant extends StatefulWidget {
  const MultiSelectDropDownComponant({super.key});

  @override
  State<MultiSelectDropDownComponant> createState() =>
      _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDownComponant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiSelectDropDown(
        clearIcon: Icon(Icons.clear),
        onOptionSelected: (options) {
          debugPrint(options.toString());
        },
        options: const <ValueItem>[
          ValueItem(label: 'Option 1', value: '1'),
          ValueItem(label: 'Option 2', value: '2'),
          ValueItem(label: 'Option 3', value: '3'),
          ValueItem(label: 'Option 4', value: '4'),
          ValueItem(label: 'Option 5', value: '5'),
          ValueItem(label: 'Option 6', value: '6'),
        ],
        maxItems: 7,
        disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
        selectionType: SelectionType.multi,
        chipConfig: const ChipConfig(
          wrapType: WrapType.wrap,
          backgroundColor: Colors.blue,
        ),
        dropdownHeight: 300,
        selectedOptionTextColor: Colors.blue,
        optionTextStyle: const TextStyle(fontSize: 16),
        selectedOptionIcon: const Icon(Icons.check_circle),
      ),
    );
  }
}
