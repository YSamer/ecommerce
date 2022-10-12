import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class LoginData {
  CRUD crud;

  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.post(AppLinks.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
