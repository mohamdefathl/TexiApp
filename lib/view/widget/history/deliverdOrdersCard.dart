import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taxiapp/data/models/delivryhistory_model.dart';
import 'package:taxiapp/view/widget/history/historyTitleLocationNumber.dart';
import 'package:taxiapp/view/widget/history/historyTitlewithIcon.dart';

class DeliverdOrders extends StatelessWidget {
  DeliverdOrders({
    super.key,
    required this.themeText,
    required this.deliveryHistoryModel, required this.colorScheme,
  });

  final TextTheme themeText;
  final ColorScheme colorScheme;
  final DeliveryHistoryModel deliveryHistoryModel;
  Set<int> uniqueIds = Set<int>();

  @override
  Widget build(BuildContext context) {
    String arabicFormattedDate = formatDate(deliveryHistoryModel.doneDeliveryDate);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HistoryMainTitleWithIcon(
                themeText: themeText,
                image: "assets/images/motocyle.png",
                title: "معلومات الطلب #${deliveryHistoryModel.codeNumber}",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Color(0xFFEEFCF5),
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      borderRadius: BorderRadius.circular(20),                      
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      'تكلفة التوصيل ريال ${deliveryHistoryModel.shippingCost}',
                      style: themeText.titleSmall!
                          .copyWith(color: const Color(0xFF4CBA87), fontSize: 11),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        
                        arabicFormattedDate,
                        style: themeText.titleSmall!
                            .copyWith(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              HistoryMainTitleWithIcon(
                themeText: themeText,
                image: "assets/images/user.png",
                title: "معلومات الزبون",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: HistoryTitleLocationNumber(
                  themeText: themeText,
                  title: deliveryHistoryModel.customer.fullName!,
                  location: deliveryHistoryModel.address,
                  phoneNumber: '778940511',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              HistoryMainTitleWithIcon(
                themeText: themeText,
                image: "assets/images/facility.png",
                title: "معلومات المنشأة",
              ),

              ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                shrinkWrap: true,
                itemCount: deliveryHistoryModel.facilities.length,
                itemBuilder: (context, index) {
                  final facility = deliveryHistoryModel.facilities[index];

                  if (!uniqueIds.contains(facility.id)) {
                    uniqueIds.add(facility.id);

                    return HistoryTitleLocationNumber(
                      title: facility.fullName,
                      location: facility.address,
                      phoneNumber: facility.phone,
                      themeText: themeText,
                    );
                  } else {
                    // Return an empty container for duplicate items
                    return Container();
                  }
                },
              ),
              // HistoryTitleLocationNumber(
              //   title: 'فلافل المعلم ',
              //   location: 'صنعاء جدة شارع صفر',
              //   phoneNumber: '778123121',
              //   themeText: themeText,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              )
            ],
          ),
        ),
      ),
    );
  }
}

String formatDate(DateTime date) {
  final arabicFormat = DateFormat('dd MMMM yyyy', 'ar');

  // Format the date in Arabic
  final formattedDate = arabicFormat.format(date);

  return formattedDate;
}