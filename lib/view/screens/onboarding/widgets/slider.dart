import 'package:ecommerce_1/controller/onboarding_controller.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:ecommerce_1/data/data_source/static/static.dart';
import 'package:ecommerce_1/view/widgets/texts/subtitle_text.dart';
import 'package:ecommerce_1/view/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSlider extends GetView<OnBoardingController> {
  const OnBoardingSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset(onBoardingList[i].image),
              const SizedBox(height: 30),
              TitleText(text: onBoardingList[i].title),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: SubTitleText(text: onBoardingList[i].body),
              ),
            ],
          ),
        );
      },
    );
  }
}
