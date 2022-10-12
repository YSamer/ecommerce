import 'package:ecommerce_1/view/screens/home_screens/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreensControllerInit extends GetxController {
  changePage(int currentPage);
}

class HomeScreensController extends HomeScreensControllerInit {
  int currentPage = 0;
  List<Widget> pagesList = [
    const HomePage(),
    Center(child: Text('Favourites')),
    Center(child: Text('Settings')),
    Center(child: Text('Profile')),
  ];

  List<String> tabsNames = ['70'.tr, '71'.tr, '72'.tr, '73'.tr];
  List<IconData> tabsIcons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.settings_outlined,
    Icons.person_outline_rounded,
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  changePage(int toPage) {
    currentPage = toPage;
    update();
  }
}
