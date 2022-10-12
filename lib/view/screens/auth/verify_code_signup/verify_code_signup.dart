import 'package:ecommerce_1/controller/auth/verify_code_signup_controller.dart';
import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title2_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyCodeSignUpController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            title: Title2Text(text: '39'.tr),
            centerTitle: true,
          ),
          body: HandlingDataRequest(
            statusRequest: controller.statusRequest,
              press: () {
                controller.statusRequest = StatusRequest.none;
                controller.update();
              },
            widget: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                children: [
                  const SizedBox(height: 30),
                  //Check Code text
                  Center(child: TitleText(text: '40'.tr)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: SubTitleText(text: '41'.tr),
                  ),
                  const SizedBox(height: 70),
                  //OTP Check Field
                  OtpTextField(
                    // fieldWidth: 40,
                    numberOfFields: 4,
                    borderRadius: BorderRadius.circular(20),
                    borderColor: Colors.purple,
                    showFieldAsBox: true,
                    onCodeChanged: (value) {},
                    onSubmit: (value) {
                      controller.checkCode(value);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
