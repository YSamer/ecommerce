import 'package:ecommerce_1/core/constants/routes.dart';
import 'package:ecommerce_1/core/localization/change_local.dart';
import 'package:ecommerce_1/core/localization/translation.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:ecommerce_1/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: AppTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: AppDependencies(),
      getPages: routes,
    );
  }
}
