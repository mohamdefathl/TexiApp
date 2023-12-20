import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
    required this.onGoaingOrder,
  });
  final OnGoaingOrderModel onGoaingOrder;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardMessageRow(phoneNumber: "${onGoaingOrder.customer!.phone}"),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        onGoaingOrder.customer!.fullName!,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14),
                      ),
                      Text(
                        "${onGoaingOrder.customer!.phone}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.green, fontSize: 11),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.primary,
                      ),
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
