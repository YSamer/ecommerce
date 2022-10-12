import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class VerifyCodeForgetPasswordData {
  CRUD crud;

  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.post(AppLinks.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
