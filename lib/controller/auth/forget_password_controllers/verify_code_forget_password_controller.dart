import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/data/data_source/remote/auth/forget_password/verify_code_forget_password_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeControllerInit extends GetxController {
  checkCode(String verifyCode);
  goToResetPassword();
}

class VerifyCodeController extends VerifyCodeControllerInit {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postData(
      email!,
      verifyCode,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetPassword, arguments: {
            'email': email!,
          });
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
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }
}
