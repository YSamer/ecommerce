import 'dart:developer';

import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class SignUpData {
  CRUD crud;

  SignUpData(this.crud);

  postData(String username, String password, String email, String phone) async {
    var response = await crud.post(AppLinks.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
