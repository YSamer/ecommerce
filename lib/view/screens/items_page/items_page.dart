import 'package:ecommerce_1/controller/items_controller.dart';
import 'package:ecommerce_1/view/screens/items_page/widgets/categories_listview_items.dart';
import 'package:ecommerce_1/view/screens/items_page/widgets/items_gridview.dart';
import 'package:ecommerce_1/view/widgets/other/app_bar.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());

    return GetBuilder<ItemsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
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
                  // =============== Categories ===============//
                  const CategoriesListViewItems(),
                  // =============== Items ===============//
                  const ItemsGridView()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
