import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_1/controller/home_screens/screens/home_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/data/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsListView extends GetView<HomeController> {
  const ItemsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 15);
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return Items(
            itemsModel: ItemsModel.fromJson(
              controller.items[index],
            ),
          );
        },
      ),
    );
  }
}

class Items extends GetView<HomeController> {
  const Items({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    bool isEn = controller.lang == 'en';
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            height: 150,
            width: 170,
            fit: BoxFit.contain,
            imageUrl: '${itemsModel.itemsImage}',
            placeholder: (context, url) {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidget: (context, url, error) {
              return Container(
                color: Colors.grey.shade100,
                child: const Center(
                  child: Icon(
                    Icons.error_outline_outlined,
                    color: Colors.redAccent,
                    size: 40,
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.1),
                AppColors.primaryColor.withOpacity(0.7),
              ],
              stops: const [0.5, 0.75],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: 170,
            height: 100,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              isEn ? itemsModel.itemsName! : itemsModel.itemsNameAr!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
