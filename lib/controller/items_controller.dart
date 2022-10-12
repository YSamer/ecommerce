import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:ecommerce_1/data/data_source/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsControllerInit extends GetxController {
  init();
  changeCategory(int index, String catId);
  getItems(String categoryId);
}

class ItemsController extends ItemsControllerInit {
  late List categories;
  late int selectedCategory;
  late String categoryId;

  // Language
  AppServices appServices = Get.find();
  String? lang;

  //Data
  ItemsData itemsData = ItemsData(Get.find());
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  init() {
    lang = appServices.sharedPreferences.getString('lang');
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selected_category'];
    categoryId = Get.arguments['categoryId'];
    getItems(categoryId);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  changeCategory(int index, String catId) {
    selectedCategory = index;
    categoryId = catId;
    getItems(catId);
    update();
  }

  @override
  getItems(String categoryId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(categoryId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  
}
