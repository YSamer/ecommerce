import 'package:ecommerce_1/controller/test_data_controller.dart';
import 'package:ecommerce_1/view/widgets/handling_data_view.dart';
import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestDataScreen extends StatelessWidget {
  const TestDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.offAllNamed('/');
        },
        child: GetBuilder<TestController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text('${controller.data}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
