import 'package:ecommerce_1/controller/auth/check_email_controller.dart';
import 'package:ecommerce_1/controller/auth/forget_password_controllers/forget_password_controller.dart';
import 'package:ecommerce_1/controller/auth/forget_password_controllers/reset_password_controller.dart';
import 'package:ecommerce_1/controller/auth/forget_password_controllers/success_reset_password_controller.dart';
import 'package:ecommerce_1/controller/auth/forget_password_controllers/verify_code_forget_password_controller.dart';
import 'package:ecommerce_1/controller/auth/login_controller.dart';
import 'package:ecommerce_1/controller/auth/signup_controller.dart';
import 'package:ecommerce_1/controller/auth/success_signup_controller.dart';
import 'package:ecommerce_1/controller/auth/verify_code_signup_controller.dart';
import 'package:ecommerce_1/controller/onboarding_controller.dart';
import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:get/get.dart';

class AppDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
    //
    Get.lazyPut(() => OnBoardingController(), fenix: true);
    //
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => SuccessResetPasswordController(), fenix: true);
    Get.lazyPut(() => SuccessSignUpController(), fenix: true);
    Get.lazyPut(() => CheckEmailController(), fenix: true);
    Get.lazyPut(() => VerifyCodeController(), fenix: true);
    Get.lazyPut(() => VerifyCodeSignUpController(), fenix: true);
    // Get.lazyPut(() => (), fenix: true);
    // Get.lazyPut(() => (), fenix: true);
    // Get.lazyPut(() => (), fenix: true);
  }
}
