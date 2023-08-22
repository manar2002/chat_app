import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.hintText, this.onChanged});
  final String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: kPrimaryColorWhite,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColorWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColorBlue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColorRed,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColorWhite,
          ),
        ),
      ),
    );
  }
}