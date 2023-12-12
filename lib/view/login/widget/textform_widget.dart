import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    this.prefixIcon,
    required this.placeHolder,
    required this.textcontroller,
  });
  final IconData? prefixIcon;
  final String? placeHolder;
  final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        prefixIcon: Icon(prefixIcon),
        hintText: placeHolder,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
