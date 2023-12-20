import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/delivery_controllers/ongoaing_controller.dart';
import 'package:taxiapp/view/widget/general/online.dart';

class onGoaingAppBar extends StatelessWidget {
  const onGoaingAppBar({
    super.key,
    required this.themeText,
    required this.authController,
  });

  final TextTheme themeText;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      title: Stack(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Online(),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "طلبات جارية",
              style: themeText.titleLarge,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(13),
              child: GetBuilder<OnGoaingController>(
                init: OnGoaingController(),
                builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      Get.dialog(const Center(
                        child:
                            CircularProgressIndicator(color: AppColor.primary),
                      ));
                      controller
                          .getData(authController.token)
                          .then((_) => Get.back());
                    },
                    child: const Icon(
                      Iconsax.refresh,
                      color: AppColor.primary,
                    ),
                  );
                },
              ),
            )),
          )
        ],
      ),
      
      pinned: false,
      snap: true,
      floating: true,
      stretch: true,
      
    );
  }
}
