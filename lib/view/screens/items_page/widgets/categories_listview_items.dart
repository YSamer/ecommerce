import 'package:ecommerce_1/controller/items_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListViewItems extends GetView<ItemsController> {
  const CategoriesListViewItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(5),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
            index: index,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsController> {
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.index,
  }) : super(key: key);

  final CategoriesModel categoriesModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategory(index, categoriesModel.categoriesId!);
      },
      child: GetBuilder<ItemsController>(
        builder: (controller) {
          bool isEn = controller.lang == 'en';
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: controller.selectedCategory == index
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: controller.selectedCategory == index
                      ? AppColors.primaryColor
                      : Colors.white70),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  color: controller.selectedCategory == index
                      ? AppColors.thirdColor
                      : Colors.grey.shade300,
                ),
              ],
            ),
            child: Center(
              child: Text(
                isEn? categoriesModel.categoriesName!:categoriesModel.categoriesNameAr!,
                style: TextStyle(
                  fontSize: 15,
                  color: controller.selectedCategory == index
                      ? AppColors.whiteColor
                      : AppColors.greyColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
