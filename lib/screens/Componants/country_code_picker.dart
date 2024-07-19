import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void pickCountryCode(BuildContext context, void Function(Country) onSelect) {
  showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: onSelect);
}

class PickCountryCode {
  //final String phonecode;
  //final String flagEmoji;
}
