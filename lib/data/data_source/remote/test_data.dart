import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class TestData {
  CRUD crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.post(AppLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
