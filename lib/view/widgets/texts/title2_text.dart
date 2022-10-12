import 'package:flutter/material.dart';

class Title2Text extends StatelessWidget {
  const Title2Text({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
