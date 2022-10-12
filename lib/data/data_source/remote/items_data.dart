import 'package:ecommerce_1/core/classes/crud.dart';
import 'package:ecommerce_1/core/constants/links_api.dart';

class ItemsData {
  CRUD crud;

  ItemsData(this.crud);

  getData(String id) async {
    var response = await crud.post(AppLinks.items, {'id': id});
    return response.fold((l) => l, (r) => r);
  }
}
