import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWithButton extends StatelessWidget {
  const TextWithButton({
    Key? key,
    required this.text,
    required this.buttonText,
    this.fontSize = 12,
    required this.press,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  final String text, buttonText;
  final double fontSize;
  final MainAxisAlignment mainAxisAlignment;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SubTitleText(
          text: text,
          fontSize: fontSize,
        ),
        TextButton(
          onPressed: press,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: fontSize + 1,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
