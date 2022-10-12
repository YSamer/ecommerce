import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/view/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LottieBuilder.asset(
              'assets/lottie/loading.json',
              width: 150,
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: LottieBuilder.asset(
                  'assets/lottie/offline.json',
                  width: 150,
                ),
              )
            : statusRequest == StatusRequest.failure
                ? Center(
                    child: LottieBuilder.asset(
                      'assets/lottie/nodata.json',
                      width: 150,
                      repeat: true,
                    ),
                  )
                : statusRequest == StatusRequest.serverFailure
                    ? Center(
                        child: LottieBuilder.asset(
                          'assets/lottie/server.json',
                          width: 150,
                        ),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
    required this.press,
  });
  final StatusRequest statusRequest;
  final Widget widget;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Column(
              children: [
                const Spacer(),
                LottieBuilder.asset(
                  'assets/lottie/loading.json',
                  width: 150,
                ),
                const Spacer(),
                PrimaryButton(
                  buttonText: '50'.tr,
                  press: press,
                ),
                const Spacer(),
              ],
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Column(
                  children: [
                    const Spacer(),
                    LottieBuilder.asset(
                      'assets/lottie/offline.json',
                      width: 150,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      buttonText: '64'.tr,
                      press: press,
                    ),
                    const Spacer(),
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Column(
                      children: [
                        const Spacer(),
                        LottieBuilder.asset(
                          'assets/lottie/server.json',
                          width: 150,
                        ),
                        const Spacer(),
                        PrimaryButton(
                          buttonText: '64'.tr,
                          press: press,
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                : widget;
  }
}
