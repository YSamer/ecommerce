import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpControllerInit extends GetxController {
  goToLogin();
}

class SuccessSignUpController extends SuccessSignUpControllerInit {

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
