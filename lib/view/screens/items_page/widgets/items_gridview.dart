import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_1/controller/items_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/data/models/items_model.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 160,
      child: GetBuilder<ItemsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5,
              ),
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                ItemsModel item = ItemsModel.fromJson(controller.items[index]);
                return Items(
                    item: item, isFavourite: true, lang: controller.lang!);
              },
            ),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    Key? key,
    required this.item,
    required this.isFavourite,
    required this.lang,
  }) : super(key: key);

  final ItemsModel item;
  final bool isFavourite;
  final String lang;

  @override
  Widget build(BuildContext context) {
    bool isEn = lang == 'en';
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 150,
                  fit: BoxFit.contain,
                  imageUrl: item.itemsImage!,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      color: AppColors.thirdColor,
                      child: const Center(
                        child: Icon(
                          Icons.error_outline_outlined,
                          color: AppColors.redColor,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(flex: 2),
              Text(
                isEn ? item.itemsName! : item.itemsNameAr!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const Spacer(flex: 2),
              Text(
                isEn ? item.itemsDesc! : item.itemsDescAr!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.thirdColor,
                ),
              ),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.itemsPrice} \$',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.redColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: isFavourite
                        ? const Icon(
                            Icons.favorite_rounded,
                            color: AppColors.primaryColor,
                          )
                        : const Icon(
                            Icons.favorite_outline_rounded,
                            color: AppColors.thirdColor,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
