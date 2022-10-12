import 'package:ecommerce_1/controller/auth/forget_password_controllers/reset_password_controller.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/core/functions/valid_inputs.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:ecommerce_1/view/widgets/text_form_fields/primary_text_form_field.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title2_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            title: Title2Text(text: '42'.tr),
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
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  children: [
                    const SizedBox(height: 20),
                    //Check Email text
                    Center(child: TitleText(text: '35'.tr)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: SubTitleText(text: '34'.tr),
                    ),
                    const SizedBox(height: 50),
                    //Password Field
                    GetBuilder<ResetPasswordController>(
                      builder: (controller) {
                        return PrimaryTextFormField(
                          labelText: '35'.tr,
                          hintText: '43'.tr,
                          valid: (value) {
                            return validInputs(value!, 'password');
                          },
                          obscureText: controller.isObscureText,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          icon: controller.isObscureText
                              ? Icons.lock_outline
                              : Icons.lock_open_outlined,
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.passwordController,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    //Confirm Password Field
                    GetBuilder<ResetPasswordController>(
                      builder: (controller) {
                        return PrimaryTextFormField(
                          labelText: '45'.tr,
                          hintText: '44'.tr,
                          valid: (value) {
                            return validInputs(value!, 'password');
                          },
                          obscureText: controller.isObscureText,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          icon: controller.isObscureText
                              ? Icons.lock_outline
                              : Icons.lock_open_outlined,
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.confirmPasswordController,
                        );
                      },
                    ),
                    const SizedBox(height: 60),
                    //Check button
                    SizedBox(
                      height: 45,
                      child: PrimaryButton(
                        buttonText: '30'.tr,
                        borderRadius: 22,
                        press: () {
                          controller.resetPassword();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
