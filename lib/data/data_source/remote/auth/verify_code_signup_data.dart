import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class VerifyCodeSignUpData {
  CRUD crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.post(AppLinks.verifyCode, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
