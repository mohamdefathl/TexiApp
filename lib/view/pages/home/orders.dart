import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/constant/mapconstart.dart';
import 'package:taxiapp/view/widget/elevatedButton.dart';
import 'package:taxiapp/view/widget/home/order.dart';
import 'package:taxiapp/view/widget/home/order.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:CustomElevatedButton(
                onPressed: () {}, title: "ترتيب الطلبات حسب الاقرب") ,
      backgroundColor: AppColor.blackSecond,
      appBar: AppBar(
        backgroundColor: AppColor.blackSecond,
        centerTitle: true,
        title: Text(
          "الطلبات",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        scrolledUnderElevation: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.e,
          children: [
            
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            SizedBox(height: 90,)
          ],
        ),
      ),
    );
  }
}
