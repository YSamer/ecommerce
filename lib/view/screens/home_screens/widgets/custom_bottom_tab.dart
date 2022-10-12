import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomTab extends StatelessWidget {
  const CustomBottomTab({
    Key? key,
    required this.tabText,
    required this.icon,
    this.selectedItemColor = AppColors.primaryColor,
    this.unSelectedItemColor = AppColors.thirdColor,
    this.bckgroundColor = Colors.white,
    this.active = false,
    required this.onPressed,
  }) : super(key: key);

  final String tabText;
  final IconData icon;
  final Color selectedItemColor, unSelectedItemColor, bckgroundColor;
  final bool active;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5;
    return MaterialButton(
      minWidth: width,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? selectedItemColor : unSelectedItemColor,
          ),
          Text(
            tabText,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: active ? selectedItemColor : unSelectedItemColor,
            ),
          ),
        ],
      ),
    );
  }
}
