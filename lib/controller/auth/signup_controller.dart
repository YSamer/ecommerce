import 'dart:developer';

import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/data/data_source/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpControllerInit extends GetxController {
  signup();
  goToLogin();
}

class SignUpController extends SignUpControllerInit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  bool isObscureText = true;

  //Data post
  SignUpData signUpData = SignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isObscureText = !isObscureText;
    update();
  }

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  signup() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
        usernameController.text,
        passwordController.text,
        emailController.text,
        phoneController.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(
            AppRoutes.verifyCodeSignUp,
            arguments: {'email': emailController.text},
          );
        } else {
          Get.defaultDialog(title: '58'.tr, middleText: '59'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not valid');
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
