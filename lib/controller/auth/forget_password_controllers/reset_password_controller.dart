import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/data/data_source/remote/auth/forget_password/reset_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControllerInit extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordController extends ResetPasswordControllerInit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isObscureText = true;

  //Data post
  String? email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  
  showPassword() {
    isObscureText = !isObscureText;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postData(
          email!,
          passwordController.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            goToSuccessResetPassword();
          } else {
            Get.defaultDialog(title: '58'.tr, middleText: '64'.tr);
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      } else {
        Get.defaultDialog(title: '58'.tr, middleText: '63'.tr);
      }
    } else {
      print('not valid');
    }
  }

  @override
  goToSuccessResetPassword() {
    Get.offAllNamed(AppRoutes.successResetPassword);
  }
}
