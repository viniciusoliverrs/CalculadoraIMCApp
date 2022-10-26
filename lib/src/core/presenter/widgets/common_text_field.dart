// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String infoText;
  final String label;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.infoText,
    required this.formKey,
    this.textAlign = TextAlign.center,
    this.keyboardType = TextInputType.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: label, labelStyle: const TextStyle(color: Colors.green)),
        textAlign: textAlign,
        style: const TextStyle(color: Colors.green, fontSize: 25.0),
        controller: controller,
        validator: (value) {
          if (value == null) {
            return "Insira sua altura!";
          }
          return null;
        });
  }
}
