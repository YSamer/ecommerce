import 'dart:developer';
import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:ecommerce_1/data/data_source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerInit extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  goToHome();
}

class LoginController extends LoginControllerInit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isObscureText = true;

  AppServices appServices = Get.find();

  //Data post
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isObscureText = !isObscureText;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      log(value.toString());
      String? token = value;
    });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        emailController.text,
        passwordController.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          appServices.sharedPreferences.setString('id', response['data']['users_id']);
          appServices.sharedPreferences.setString('username', response['data']['users_name']);
          appServices.sharedPreferences.setString('email', response['data']['users_email']);
          appServices.sharedPreferences.setString('phone', response['data']['users_phone']);
          appServices.sharedPreferences.setString('step', '2');
          goToHome();
        } else {
          Get.defaultDialog(title: '58'.tr, middleText: '61'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not valid');
    }
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToHome() {
    Get.offAllNamed(AppRoutes.home);
  }
}
