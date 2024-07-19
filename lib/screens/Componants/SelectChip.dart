import 'package:flutter/material.dart';

class SelectedChip extends StatefulWidget {
  SelectedChip({super.key});

  @override
  State<SelectedChip> createState() => _SelectedChipState();
}

class _SelectedChipState extends State<SelectedChip> {
  List<String> SelectedItems = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: _onpressedmethode,
            child: const Text("Select your language")),
        const Divider(
          height: 30,
        ),
        Wrap(
          children: SelectedItems.map((e) => Chip(
                label: Text(e),
                onDeleted: () => setState(() {
                  SelectedItems.remove(e);
                }),
              )).toList(),
        )
      ],
    );
  }

  void _onpressedmethode() async {
    final List<String> Items = [
      "English",
      "Francais"
          "Italian",
      "Arabic"
    ];
    final List<String> results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(
            items: Items,
            Text: "",
          );
        });

    if (results != null) {
      setState(() {
        SelectedItems = results;
      });
    }
  }
}

class MultiSelect extends StatefulWidget {
  final String Text;
  final List<String> items;
  const MultiSelect({Key? key, required this.items, required this.Text})
      : super(key: key);

  @override
  State<MultiSelect> createState() {
    return MultiSelectState();
  }
}

class MultiSelectState extends State<MultiSelect> {
  final List<String> _SelectedItems = [];

  void _itemChange(String Itemvalue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _SelectedItems.add(Itemvalue);
      } else {
        _SelectedItems.remove(Itemvalue);
      }
    });
  }

  void _canel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _SelectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: Text(widget.Text),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                  value: _SelectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isCheked) => _itemChange(item, isCheked!)))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: _canel,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            )),
        ElevatedButton(
          onPressed: _submit,
          child: const Text("Submit", style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }
}
