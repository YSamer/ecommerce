import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  AppServices appServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoutes.home);
    } else if (appServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
