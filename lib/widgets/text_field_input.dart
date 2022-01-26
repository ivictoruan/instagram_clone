import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController? textEditingcontroller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool isPass;

  const TextFieldInput({ Key? key, 
  this.textEditingcontroller,
  this.hintText,
  this.keyboardType,
  required this.isPass }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context), // n entendi o proposito!
    );
    return TextField(
      controller: textEditingcontroller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: keyboardType,
      obscureText: isPass,
    );
  }
}