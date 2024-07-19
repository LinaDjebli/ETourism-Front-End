import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchField extends StatefulWidget {
  final List<String> listOfItems;

  SearchField({super.key, required this.listOfItems});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TypeAheadField(
            noItemsFoundBuilder: (context) => const SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Item Found "),
                    SizedBox(width: 10),
                    LinkText(
                      "Search in GoogleMaps",
                      // onLinkTap:()=> _searchInGoogleMaps,
                      textStyle: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
            suggestionsCallback: (value) =>
                listOfThings(widget.listOfItems, value),
            itemBuilder: (context, String suggestion) {
              return Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  suggestion,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
            debounceDuration: const Duration(milliseconds: 400),
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "search",
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(108, 120, 116, 116)),
                  borderRadius:
                      BorderRadius.circular(10.0), // Set borderRadius here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(108, 117, 115, 115)),
                  borderRadius:
                      BorderRadius.circular(10.0), // Set borderRadius here
                ),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
            ),
            onSuggestionSelected: (String suggestion) {
              setState(() {
                _controller.text =
                    suggestion; // Update the text field with the selected suggestion
              });
            },
          ),
        ],
      ),
    );
  }

  List<String> listOfThings(List<String> items, String query) {
    if (query.isEmpty) {
      return items;
    } else {
      return items
          .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
  }

  void _searchInGoogleMaps() async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${_controller.text}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
