import 'dart:developer';

import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:ecommerce_1/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingControllerInit extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingController extends OnBoardingControllerInit {
  late PageController pageController;
  int currentPage = 0;

  AppServices appServices = Get.find();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    currentPage++;
    if (currentPage >= onBoardingList.length) {
      --currentPage;
      appServices.sharedPreferences.setString('step', '1');
      log('step = 1');
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
