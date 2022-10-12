import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordControllerInit extends GetxController {
  goToLogin();
}

class SuccessResetPasswordController extends SuccessResetPasswordControllerInit {

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
