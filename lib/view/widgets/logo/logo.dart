import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.seconderyColor,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(10, 10),
              blurRadius: 35,
              color: AppColors.primaryColor,
            )
          ],
        ),
        child: const Icon(
          Icons.shopping_cart_rounded,
          size: 60,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
