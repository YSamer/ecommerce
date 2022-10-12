import 'package:ecommerce_1/controller/onboarding_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/view/screens/onboarding/widgets/progress_dots.dart';
import 'package:ecommerce_1/view/screens/onboarding/widgets/slider.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 4,
                child: OnBoardingSlider(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    const ProgressDots(),
                    const Spacer(flex: 5),
                    PrimaryButton(
                      buttonText: '8'.tr,
                      press: () => controller.next(),
                    ),
                    const Spacer(flex: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
