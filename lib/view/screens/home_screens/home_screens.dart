import 'package:ecommerce_1/controller/home_screens/home_screens_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/view/screens/home_screens/widgets/custom_bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreensController());

    return GetBuilder<HomeScreensController>(
      builder: (controller) {
        return Scaffold(
          body: controller.pagesList.elementAt(controller.currentPage),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 7,
            child: Row(
              children: [
                ...List.generate(
                  controller.pagesList.length + 1,
                  (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomBottomTab(
                            tabText: controller.tabsNames[i],
                            icon: controller.tabsIcons[i],
                            active: controller.currentPage == i ? true : false,
                            onPressed: () {
                              controller.changePage(i);
                            },
                          );
                  },
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.whiteColor,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
