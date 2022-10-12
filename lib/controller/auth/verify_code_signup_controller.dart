import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/data/data_source/remote/auth/verify_code_signup_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpControllerInit extends GetxController {
  checkCode(String verifyCode);
  goToSuccessSignUp();
}

class VerifyCodeSignUpController extends VerifyCodeSignUpControllerInit {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  
  @override
  checkCode(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(
      email!,
      verifyCode,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        goToSuccessSignUp();
      } else {
        Get.defaultDialog(title: '58'.tr, middleText: '60'.tr);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoutes.successSignup);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
