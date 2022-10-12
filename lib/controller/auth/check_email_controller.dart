import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailControllerInit extends GetxController {
  checkEmail();
  goToVerifyCodeSignUp();
}

class CheckEmailController extends CheckEmailControllerInit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  checkEmail() {
    var formDate = formKey.currentState;
    if (formDate!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  goToVerifyCodeSignUp() {
    checkEmail();
    Get.offNamed(AppRoutes.verifyCodeSignUp);
  }
}
