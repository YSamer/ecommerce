import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({
    Key? key,
    required this.text,
    this.fontSize = 14,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: fontSize),
    );
  }
}
