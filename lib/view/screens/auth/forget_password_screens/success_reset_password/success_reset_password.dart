import 'package:ecommerce_1/controller/auth/forget_password_controllers/success_reset_password_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title2_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuccessResetPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            title: Title2Text(text: '32'.tr),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Center(
                    child: Icon(
                      Icons.check_circle_outline_outlined,
                      size: 200,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TitleText(text: '37'.tr),
                  const SizedBox(height: 10),
                  SubTitleText(text: '36'.tr, fontSize: 20),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: PrimaryButton(
                      buttonText: '31'.tr,
                      borderRadius: 22,
                      press: () {
                        controller.goToLogin();
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
