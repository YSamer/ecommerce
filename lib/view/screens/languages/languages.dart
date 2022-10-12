import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/localization/change_local.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends GetView<LocalController> {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: TitleText(text: '1'.tr)),
            const SizedBox(height: 50),
            Center(
              child: PrimaryButton(
                buttonText: 'Ar',
                press: () {
                  controller.changeLanguage('ar');
                  Get.toNamed(AppRoutes.onboarding);
                },
              ),
            ),
            Center(
              child: PrimaryButton(
                buttonText: 'En',
                press: () {
                  controller.changeLanguage('en');
                  Get.toNamed(AppRoutes.onboarding);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
