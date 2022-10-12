import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class HomeData {
  CRUD crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.post(AppLinks.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
