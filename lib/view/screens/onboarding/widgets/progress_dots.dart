import 'package:ecommerce_1/controller/onboarding_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDots extends StatelessWidget {
  const ProgressDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: controller.currentPage == index ? 20 : 5,
                  height: 6,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
