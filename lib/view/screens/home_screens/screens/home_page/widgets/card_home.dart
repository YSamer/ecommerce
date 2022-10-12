import 'package:ecommerce_1/controller/home_screens/screens/home_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeController> {
  const CustomCardHome({
    Key? key,
    required this.title,
    required this.body,
    required this.onTap,
  }) : super(key: key);

  final String title, body;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isEn = controller.lang == 'en';
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: isEn ? -20 : null,
                left: isEn ? null : -20,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: AppColors.seconderyColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 130,
                alignment: Alignment.center,
                child: ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text(
                    body,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
