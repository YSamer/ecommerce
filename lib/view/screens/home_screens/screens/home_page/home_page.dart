import 'package:ecommerce_1/controller/home_screens/screens/home_controller.dart';
import 'package:ecommerce_1/view/widgets/other/app_bar.dart';
import 'package:ecommerce_1/view/screens/home_screens/screens/home_page/widgets/card_home.dart';
import 'package:ecommerce_1/view/screens/home_screens/screens/home_page/widgets/categories_listview_home.dart';
import 'package:ecommerce_1/view/screens/home_screens/screens/home_page/widgets/custom_title.dart';
import 'package:ecommerce_1/view/screens/home_screens/screens/home_page/widgets/items_listview.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    // =============== AppBar ===============//
                    CustomAppBar(
                      hintText: '74'.tr,
                      onPressedSearch: () {},
                      onPressedIcon: () {},
                    ),
                    // =============== Banner ===============//
                    CustomCardHome(
                      title: '68'.tr,
                      body: '${'69'.tr} 20%',
                      onTap: () {},
                    ),
                    // =============== Categories ===============//
                    CustomTitle(text: '65'.tr),
                    const CategoriesListViewHome(),
                    // =============== Items ===============//
                    CustomTitle(text: '66'.tr),
                    const ItemsListView(),
                    // =============== Offers ===============//
                    CustomTitle(text: '67'.tr),
                    const ItemsListView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
