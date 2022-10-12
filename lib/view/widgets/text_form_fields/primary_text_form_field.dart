import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:flutter/material.dart';

class PrimaryTextFormField extends StatelessWidget {
  const PrimaryTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.valid,
    this.obscureText = false,
    this.onTapIcon,
  }) : super(key: key);

  final String labelText, hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) valid;
  final bool obscureText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: valid,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          child: SubTitleText(text: labelText),
        ),
        suffixIcon: GestureDetector(
          onTap: onTapIcon,
          child: Icon(icon),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 25,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
