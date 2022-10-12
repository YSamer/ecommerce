import 'package:ecommerce_1/controller/auth/check_email_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/core/functions/valid_inputs.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:ecommerce_1/view/widgets/text_form_fields/primary_text_form_field.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title2_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckEmailController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            title: Title2Text(text: '27'.tr),
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
              key: controller.formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                children: [
                  const SizedBox(height: 20),
                  //Check Email text
                  Center(child: TitleText(text: '46'.tr)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: SubTitleText(text: '29'.tr),
                  ),
                  const SizedBox(height: 50),
                  //Email Field
                  PrimaryTextFormField(
                    labelText: '18'.tr,
                    hintText: '12'.tr,
                    valid: (value) {
                      return validInputs(value!, 'email');
                    },
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 60),
                  //Check button
                  SizedBox(
                    height: 45,
                    child: PrimaryButton(
                      buttonText: '30'.tr,
                      borderRadius: 22,
                      press: () {
                        controller.goToVerifyCodeSignUp();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
