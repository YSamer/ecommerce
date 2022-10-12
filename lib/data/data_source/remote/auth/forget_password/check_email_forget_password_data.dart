import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class CheckEmailData {
  CRUD crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.post(AppLinks.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
