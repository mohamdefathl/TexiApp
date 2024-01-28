import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/darkmode_controller.dart';



class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الإعدادات",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GetBuilder<DarkModeController>(
                init: DarkModeController(),
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "إسم العميل: محمد فضل الغرباني",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ToggleButtons(
                              isSelected: [
                                !Get.isDarkMode,
                                Get.isDarkMode,
                              ],
                              onPressed: (index) {
                                if (index == 0) {
                                  controller.switchToLightMode();
                                } else if (index == 1) {
                                  controller.switchToDarkMode();
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
                              fillColor: AppColor.secondary.withOpacity(0.1),
                              splashColor: AppColor.secondary,
                              selectedColor: AppColor.primary,
                              selectedBorderColor: AppColor.primary,
                              children: const [
                                Icon(Icons.light_mode),
                                Icon(Icons.dark_mode),
                              ],
                            ),
                            Text(
                              "ألوضع اليلي",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "إصدار التطبيق",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "1.2",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "سياسة الخصوصية",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.logout();
                          },
                          child: Text(
                            "تسجيل الخروج",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
