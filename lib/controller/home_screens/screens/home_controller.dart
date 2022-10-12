import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/functions/handling_data.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:ecommerce_1/data/data_source/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeControllerInit extends GetxController {
  initialData();
  getData();
  goToItemsPage(int selectedCategory, String categoryId);
}

class HomeController extends HomeControllerInit {
  AppServices appServices = Get.find();
  String? id;
  String? username;
  String? email;
  String? phone;

  // Language
  String? lang;


  //Data
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  initialData() {
    lang = appServices.sharedPreferences.getString('lang');
    id = appServices.sharedPreferences.getString('id');
    username = appServices.sharedPreferences.getString('username');
    email = appServices.sharedPreferences.getString('email');
    phone = appServices.sharedPreferences.getString('phone');
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  goToItemsPage(int selectedCategory, String categoryId) {
    Get.toNamed(AppRoutes.itemsPage, arguments: {
      'categories': categories,
      'selected_category': selectedCategory,
      'categoryId': categoryId,
    });
  }
}
