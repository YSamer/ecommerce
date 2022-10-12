import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_1/controller/home_screens/screens/home_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListViewHome extends GetView<HomeController> {
  const CategoriesListViewHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 15);
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

class Categories extends GetView<HomeController> {
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.index,
  }) : super(key: key);

  final CategoriesModel categoriesModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isEn = controller.lang == 'en';
    return InkWell(
      onTap: () {
        controller.goToItemsPage(index, categoriesModel.categoriesId!);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white70),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        child: SizedBox(
          height: 120,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 100,
                  width: 90,
                  fit: BoxFit.cover,
                  imageUrl: '${categoriesModel.categoriesImage}',
                  placeholder: (context, url) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.grey.shade300,
                    );
                  },
                ),
              ),
              const Spacer(),
              Text(
                isEn
                    ? categoriesModel.categoriesName!
                    : categoriesModel.categoriesNameAr!,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.greyColor,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
