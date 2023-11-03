import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/orederRows.dart';
import 'package:taxiapp/view/widget/simpleLine.dart';

class Order {
  String orderName;
  String destination;
  String source;
  String customerName;
  String companyName;

  Order(this.orderName, this.destination, this.source, this.customerName,
      this.companyName);
}

class Orders extends StatelessWidget {
  Orders({Key? key});

  final List<Order> orders = [
    Order(
      'برغر',
      'حده شارع الاصبحي فندق اللهبي بيت السميعيي',
      "بيت الحليلي قاسم لسلس سامح دسدس  بيت الانسي",
      "محمد فضل",
      "المعلم",
    ),
    Order(
      'بيتزا',
      'حده شارع الرياض',
      "بيت الحليلي قاسم لسلس",
      "عبدالله محمد",
      "مطعم الجود",
    ),
    Order(
      'سندويش',
      'حده شارع السلام',
      "بيت الحليلي قاسم لسلس",
      "أحمد علي",
      "مطعم الرضا",
    ),
  ];
  final List<String> titles = [
    "الطلب",
    "المصدر",
    "المسار",
    "اسم المنشئة",
    "اسم العميل"
  ];

  String getOrderValue(String title) {
    switch (title) {
      case "الطلب":
        return orders[0].orderName;
      case "المصدر":
        return orders[0].source;
      case "المسار":
        return orders[0].destination;
      case "اسم المنشئة":
        return orders[0].companyName;
      case "اسم العميل":
        return orders[0].customerName;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Card(
              color: AppColor.secondary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        final title = titles[index];
                        final value = getOrderValue(title);

                        return Column(
                          children: [
                            OrderRows(
                              title: title,
                              desc: value,
                            ),
                            SimpleLine(),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary),
                      onPressed: () {},
                      child: Text(
                        "قبول الطلب",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
