import 'dart:ui';

import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    this.borderRadius = 5.0,
    required this.press,
  }) : super(key: key);

  final String buttonText;
  final double borderRadius;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      color: AppColors.primaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
