import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/data/data_source/remote/auth/forget_password/check_email_forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControllerInit extends GetxController {
  checkEmail();
}

class ForgetPasswordController extends ForgetPasswordControllerInit {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

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
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(
        emailController.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.verifyCode, arguments: {
            'email': emailController.text,
          });
        } else {
          Get.defaultDialog(title: '58'.tr, middleText: '62'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not valid');
    }
  }

}
