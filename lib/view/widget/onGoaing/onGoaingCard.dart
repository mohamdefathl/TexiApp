import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';


import 'package:taxiapp/view/widget/onGoaing/onGoaingLocation.dart';
import 'package:taxiapp/view/widget/onGoaing/onGoaingTitlePhoneCall.dart';
import 'package:taxiapp/view/widget/panelwidget.dart';

class OnGoaingPageCard extends StatelessWidget {
  const OnGoaingPageCard({
    super.key,
    required this.themeText,
    required this.onGoaingOrder,
    required this.mapOnClick,
    required this.onClickCancel,
    required this.onClickDeliverd,
    required this.onClickChat, required this.colorScheme,
  });

  final TextTheme themeText;
  final ColorScheme colorScheme;
  
  final OnGoaingOrderModel onGoaingOrder;
  final VoidCallback mapOnClick;
  final VoidCallback onClickCancel;
  final VoidCallback onClickDeliverd;
  final VoidCallback onClickChat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "الطلب #${onGoaingOrder.codeNumber}",
                style: themeText.titleMedium!.copyWith(color: colorScheme.primary),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Divider(
                  thickness: 1,
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              OnGoingTitlePhoneCall(
                themeText: themeText,
                title: "${onGoaingOrder.customer!.fullName}",
                image: 'assets/images/user.png',
                phone: "${onGoaingOrder.customer!.phone}",
              ),
              OnGoainglocation(
                themeText: themeText,
                title: onGoaingOrder.address!,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: onGoaingOrder.groupedOrderItems?.length ?? 0,
                  itemBuilder: (context, index) {
                    int facilityId =
                        onGoaingOrder.groupedOrderItems!.keys.elementAt(index);
                    FacilityOnGoaingOrderInfo facilityOnGoaingOrderInfo =
                        onGoaingOrder.groupedOrderItems![facilityId]!;
                    return Column(
                      children: [
                        OnGoingTitlePhoneCall(
                          themeText: themeText,
                          title: facilityOnGoaingOrderInfo.fullName,
                          image: 'assets/images/facility.png',
                          phone: facilityOnGoaingOrderInfo.phone,
                        ),
                        OnGoainglocation(
                            themeText: themeText,
                            title: facilityOnGoaingOrderInfo.address)
                      ],
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              GestureDetector(
                onTap: mapOnClick,
                child: Container(
                  decoration: BoxDecoration(
                      color: colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "اظهار الخارطة",
                    style: themeText.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColor.primary),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardPanelWidget(
                      onClick: onClickCancel,
                      title: "الغاء",
                      icon: Icons.cancel_sharp),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CardPanelWidget(
                      onClick: onClickDeliverd,
                      title: "تم الإيصال ",
                      icon: Icons.check_rounded),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CardPanelWidget(
                      onClick: onClickChat,
                      title: "الدردشة ",
                      icon: Icons.chat),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
