import 'package:ecommerce_1/controller/auth/login_controller.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/core/functions/alert_exit_app.dart';
import 'package:ecommerce_1/core/functions/valid_inputs.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:ecommerce_1/view/widgets/logo/logo.dart';
import 'package:ecommerce_1/view/widgets/mix/text_with_button.dart';
import 'package:ecommerce_1/view/widgets/text_form_fields/primary_text_form_field.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title2_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: alertExitApp,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              elevation: 0.0,
              title: Title2Text(text: '9'.tr),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    children: [
                      const SizedBox(height: 20),
                      //Logo
                      const AppLogo(),
                      const SizedBox(height: 20),
                      //Welcome back
                      Center(child: TitleText(text: '10'.tr)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: SubTitleText(text: '11'.tr),
                      ),
                      const SizedBox(height: 50),
                      //Email field
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
                      const SizedBox(height: 30),
                      //Password field
                      GetBuilder<LoginController>(
                        builder: (controller) {
                          return PrimaryTextFormField(
                            labelText: '19'.tr,
                            hintText: '13'.tr,
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
                      const SizedBox(height: 10),
                      //Forget password button
                      TextWithButton(
                        text: '',
                        buttonText: '14'.tr,
                        fontSize: 13,
                        press: () {
                          controller.goToForgetPassword();
                        },
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      const SizedBox(height: 10),
                      //Signin button
                      SizedBox(
                        height: 45,
                        child: PrimaryButton(
                          buttonText: '15'.tr,
                          borderRadius: 22,
                          press: () {
                            controller.login();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Don't Have Account with Sginup button
                      TextWithButton(
                        text: '16'.tr,
                        buttonText: '17'.tr,
                        press: () {
                          controller.goToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
